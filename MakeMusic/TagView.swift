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

    
    init(with tag: String, in VC: UIViewController, at position: CGPoint) {
        super.init(frame: CGRect(x: position.x, y: position.y, width: Constant.Tag.width, height: Constant.Tag.height))
        //CGRect(x: 100, y: 100, width: 70, height: 35)
        tagLabel = UILabel(frame: self.frame)
        tagLabel.text = tag
        tagLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tagLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        self.layer.zPosition = 5
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.isUserInteractionEnabled = true
        
        self.alpha = 0
        
        self.addSubview(tagLabel)
        VC.view.addSubview(self)
        
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tagLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tagLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func animate() {
        UIView.animate(withDuration: 0.6) {
            self.alpha = 1
        }
    }
    
    func animateTap() {
        self.backgroundColor = Constant.Tag.tappedBackgroundColor
        UIView.animate(withDuration: 0.275, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { (_) in
            UIView.animate(withDuration: 0.15, animations: {
                self.transform = .identity
            })
        }
    }
    
    func destroy() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateTap()
        
        super.touchesBegan(touches, with: event)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
