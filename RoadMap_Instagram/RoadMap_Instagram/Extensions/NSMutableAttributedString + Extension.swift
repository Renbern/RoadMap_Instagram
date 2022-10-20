//
//  NSMutableAttributedString + Extension.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 20.10.2022.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    var fontSize: CGFloat { return 12 }
    var boldFont: UIFont {
        return UIFont(name: "SF Pro Text-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    var normalFont: UIFont {
        return UIFont(name: "SF Pro Text-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func grayTextColor(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.gray,
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
