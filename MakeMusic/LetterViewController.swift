//
//  LetterViewController.swift
//  MakeMusic
//
//  Created by Shutaro Aoyama on 2018/08/05.
//  Copyright © 2018年 Alexandru Turcanu. All rights reserved.
//

import UIKit

class LetterViewController: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicArtist: UILabel!
    
    @IBOutlet weak var letterTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
