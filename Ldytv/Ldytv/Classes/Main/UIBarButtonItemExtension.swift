//
//  UIBarButtonItemExtension.swift
//  Ldytv
//
//  Created by honghui on 16/10/31.
//  Copyright © 2016年 honghui. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize(width:0, height:0), target: AnyObject? = nil, action: Selector? = nil) {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: imageName), for:.normal)
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        }else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        btn.addTarget(target, action: action!, for: .touchUpInside)
        self.init(customView: btn)
    }
}
