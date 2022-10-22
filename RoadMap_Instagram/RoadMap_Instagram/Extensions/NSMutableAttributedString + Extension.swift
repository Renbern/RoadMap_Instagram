//
//  NSMutableAttributedString + Extension.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 20.10.2022.
//

import UIKit

// MARK: - Constants
private enum Fonts {
    static let SFProTextBold = "SF Pro Text-Bold"
    static let SFProTextRegular = "SF Pro Text-Regular"
}
/// Кастомизация литерала строки
extension NSMutableAttributedString {
    var fontSize: CGFloat { return 12 }
    var boldFont: UIFont {
        return UIFont(name: Fonts.SFProTextBold, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    var normalFont: UIFont {
        return UIFont(name: Fonts.SFProTextRegular, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
        ]
        
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func grayTextColor(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.gray,
        ]
        
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
