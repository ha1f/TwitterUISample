//
//  UIImage+Extension.swift
//  TwitterUISample
//

import UIKit

extension UIImage {
    func resized(to targetSize: CGSize) -> UIImage {
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = UIScreen.main.scale
        format.opaque = false
        return UIGraphicsImageRenderer(size: targetSize, format: format).image { (context) in
            draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    func clippingToRound(width: CGFloat) -> UIImage {
        let imageSize = CGSize(width: width, height: width)
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = UIScreen.main.scale
        format.opaque = false
        return UIGraphicsImageRenderer(size: imageSize, format: format).image { (context) in
            let imageRect = CGRect(origin: .zero, size: imageSize)
            let path = UIBezierPath(roundedRect: imageRect, cornerRadius: width / 2)
            path.addClip()
            draw(in: imageRect)
        }
    }
}
