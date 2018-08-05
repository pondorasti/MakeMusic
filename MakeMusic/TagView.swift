//
//  TagView.swift
//  MakeMusic
//
//  Created by Alexandru Turcanu on 04/08/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class TagView: UIView {
    
    var tagLabel: UILabel! = nil

    
    init(with tag: String, in VC: UIViewController) {
        super.init(frame: CGRect(x: 100, y: 100, width: 70, height: 35))
        
        tagLabel = UILabel(frame: self.frame)
        tagLabel.text = tag
        tagLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.layer.zPosition = 5
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.addSubview(tagLabel)
        VC.view.addSubview(self)
        
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tagLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tagLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
