//
//  String + Extension.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 20.10.2022.
//

import Foundation

/// Расширение строки, делает заглавной первую букву
extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
