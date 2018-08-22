//
//  MusicTImerViewController.swift
//  MakeMusic
//
//  Created by Shutaro Aoyama on 2018/08/04.
//  Copyright © 2018年 Alexandru Turcanu. All rights reserved.
//

import UIKit
import AVKit

class MusicTImerViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicArtist: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerBar: UIView!
    
    @IBOutlet weak var timerBarTopConstraint: NSLayoutConstraint!
    
    var timer = Timer()
    var seconds = Constant.countDown
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "00:00:\(Constant.countDown)"

        blur(imageView: bgImage)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        if let url = URL(string: Constant.Music.songURL) {
//            let playerItem: AVPlayerItem = AVPlayerItem(url: url)
//            player = AVPlayer(playerItem: playerItem)
//        }
        
        guard let url = Bundle.main.url(forResource: "Stronger", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            
//            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier else { return }
        
        switch id {
        case "toMusicPlay":
            guard let destination = segue.destination as? MusicPlayViewController else { return }
            destination.player = player
            destination.player?.play()
            
            
        default:
            fatalError("unknown id")
        }
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            //TODO: perform segue to next screen
            performSegue(withIdentifier: "toMusicPlay", sender: self)
        } else {
            seconds -= 1
            if seconds == Constant.countDown - 1 {
                setTimerBar(0.0)
            }
            timerLabel.text = TimeInterval(seconds).toString()
        }
    }

    func setTimerBar(_ progress: CGFloat) {
        if progress <=  1 {
            let spacing = view.frame.height * (1 - progress)
            self.timerBarTopConstraint.constant = spacing
            UIView.animate(withDuration: TimeInterval(Constant.countDown), delay: 0, options: [.curveLinear], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    var context = CIContext(options: nil)
    func blur(imageView: UIImageView) {
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: imageView.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(30, forKey: kCIInputRadiusKey)
        
        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
        
        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        imageView.image = processedImage
    }
}


