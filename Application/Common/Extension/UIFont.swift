//
//  UIFont.swift
//  Application
//
//  Created by Bùi Văn Thuyên on 08/04/2022.
//

import UIKit

extension UIFont {
    class func mainFont() -> UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
    
    class func title() -> UIFont {
        return UIFont.bold(size: 22)
    }
    
    class func bold(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
}
