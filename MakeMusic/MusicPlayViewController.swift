//
//  MusicPlayViewController.swift
//  MakeMusic
//
//  Created by Shutaro Aoyama on 2018/08/04.
//  Copyright © 2018年 Alexandru Turcanu. All rights reserved.
//

import UIKit
import AVKit

class MusicPlayViewController: UIViewController {

    @IBOutlet weak var chatTable: UITableView!
    
    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicArtist: UILabel!
    
    @IBOutlet weak var chatButtonSpacing: NSLayoutConstraint!
    
    //var lastKeyboardHeight = CGFloat(0.0)
    var numberOfCellsToShow = 0
    var currentTime = 0
    var timer = Timer()
    var currentSecond = 30
    var player: AVAudioPlayer?
    var tagViews = [TagView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(30)) {
            self.performSegue(withIdentifier: "showStats", sender: self)
            self.player?.pause()
            //TODO: stop music
        }
    }
    
    @objc func updateTimer() {
        if currentSecond < 1 {
            timer.invalidate()
            //TODO: perform segue to next screen
            
        } else {
            currentSecond -= 1
            currentTime += 1
            if Constant.Music.messages[numberOfCellsToShow + 1].timeStamp <= currentTime {
                numberOfCellsToShow += 1
                tagHashTag(for: Constant.Music.messages[numberOfCellsToShow].text)
                chatTable.reloadData()
                chatTable.scrollToBottom()
            }
        }
    }

    func tagHashTag(for string: String) {
        let arrayOfWords = string.components(separatedBy: " ")
        for word in arrayOfWords {
            if word.first == "#" {
                createTag(withText: word)
                return
            }
        }
    }
    
    func createTag(withText text: String) {
        let position = findSpot()
        let newTag = TagView(with: text, in: self, at: position)
        newTag.layer.zPosition = 10
        coverImage.addSubview(newTag)
        tagViews.append(newTag)
        tagViews.last?.animate()
        
        if tagViews.count >= 4 {
            tagViews.first?.destroy()
            tagViews.remove(at: 0)
        }
    }
    
    func findSpot() -> CGPoint {
        
        while true {
            let startX = 0
            let endX = 250
            
            let startY = 0
            let endY = 300
            
            let xRange = startX...endX
            let yRange = startY...endY
            let position = CGPoint.randomPoint(inXRange: xRange, andYRange: yRange)
            
            let frame = CGRect(x: position.x, y: position.y, width: Constant.Tag.width, height: Constant.Tag.height)
            
            var goodPoint = true
            
            for tag in tagViews where goodPoint == true {
                if tag.frame.intersects(frame) {
                    goodPoint = false
                }
            }
            
            if goodPoint {
                return position
            }
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let text = messageField.text, text != "" else { return }
        messageField.text = ""
        createTag(withText: text)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.2, animations: {
                self.chatButtonSpacing.constant += 291.0//keyboardSize.height
                self.view.layoutIfNeeded()
            })
            print(keyboardSize.height)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.2, animations: {
                self.chatButtonSpacing.constant -= 291.0//keyboardSize.height
                self.view.layoutIfNeeded()
            })
            print(keyboardSize.height)
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        messageField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: coverImage)
        
        for tag in tagViews {
            if tag.frame.contains(location) {
                tag.animateTap()
                return
            }
        }
    }

}

extension MusicPlayViewController: UITableViewDelegate {
    
}

extension MusicPlayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCellsToShow + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatCell = chatTable.dequeueReusableCell(withIdentifier: "chatCell") as! ChatCell
        chatCell.messageLabel.text = Constant.Music.messages[indexPath.row].text
        return chatCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
}

extension MusicPlayViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
