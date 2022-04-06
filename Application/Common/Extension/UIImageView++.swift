//
//  UIImageView++.swift
//  Application
//
//  Created by Bùi Văn Thuyên on 05/04/2022.
//

import Foundation
import RxSwift
import Kingfisher
import Platform

extension Reactive where Base: UIImageView {
    var imageURL: Binder<URL?> {
        return self.imageURL(placeHolder: nil)
    }
    
    func imageURL(placeHolder: UIImage?, cornerRadius: CGFloat) -> Binder<URL?> {
        let processor = RoundCornerImageProcessor(cornerRadius: cornerRadius)
        return self.imageURL(placeHolder: placeHolder, options: [.processor(processor)])
    }
    
    func imageURL(placeHolder: UIImage?, options: KingfisherOptionsInfo? = [], showIndicator: Bool = false) -> Binder<URL?> {
        return Binder(self.base, binding: { imageView, url in
            
            if showIndicator == true {
                imageView.kf.indicatorType = .activity
            }
            
            var kingfisherOptions = options
            kingfisherOptions?.append(.transition(.fade(1)))
            
            imageView.kf.setImage(with: url,
                                  placeholder: placeHolder,
                                  options: kingfisherOptions,
                                  progressBlock: nil,
                                  completionHandler: nil)
        })
    }
}

extension UIImageView {
    func imageURL(url: URL?, placeHolder: UIImage? = nil) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,
                              placeholder: placeHolder,
                              options: [.transition(.fade(1))],
                              progressBlock: nil,
                              completionHandler: nil)
    }
    
    func googleImage(reference: String?, maxWidth: Int? = nil, maxHeight: Int? = nil, placeHolder: UIImage? = nil) {
        let url = genGooglePhoto(reference: reference, maxWidth: maxWidth, maxHeight: maxHeight)
        self.imageURL(url: url, placeHolder: placeHolder)
    }
}
