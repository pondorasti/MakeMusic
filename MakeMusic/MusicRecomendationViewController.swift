//
//  MusicRecomendationViewController.swift
//  MakeMusic
//
//  Created by Shutaro Aoyama on 2018/08/05.
//  Copyright © 2018年 Alexandru Turcanu. All rights reserved.
//

import UIKit

class MusicRecomendationViewController: UIViewController {

    @IBOutlet weak var music1Title: UILabel!
    @IBOutlet weak var music1Artist: UILabel!
    @IBOutlet weak var music1Counter: UILabel!
    
    @IBOutlet weak var music2Title: UILabel!
    @IBOutlet weak var music2Artist: UILabel!
    @IBOutlet weak var music2Counter: UILabel!
    
    @IBOutlet weak var music3Title: UILabel!
    @IBOutlet weak var music3Artist: UILabel!
    @IBOutlet weak var music3Counter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func music1FireTapped(_ sender: Any) {
        guard let text = music1Counter.text, let counter = Int(text) else { return }
        music1Counter.text = String(counter + 1)
    }
    @IBAction func music2FireTapped(_ sender: Any) {
        guard let text = music2Counter.text, let counter = Int(text) else { return }
        music2Counter.text = String(counter + 1)
    }
    @IBAction func music3FireTapped(_ sender: Any) {
        guard let text = music3Counter.text, let counter = Int(text) else { return }
        music3Counter.text = String(counter + 1)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
