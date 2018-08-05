//
//  Blur.swift
//  MakeMusic
//
//  Created by Shutaro Aoyama on 2018/08/04.
//  Copyright © 2018年 Alexandru Turcanu. All rights reserved.
//

import UIKit

struct Util {
    static func blur(imageView: UIImageView) {
        var context = CIContext(options: nil)
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: imageView.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(15, forKey: kCIInputRadiusKey)
        
        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
        
        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        imageView.image = processedImage
    }
}
