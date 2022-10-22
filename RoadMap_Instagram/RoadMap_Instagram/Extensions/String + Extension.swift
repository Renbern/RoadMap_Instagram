//
//  String + Extension.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 20.10.2022.
//

/// Расширение строки, делает заглавной первую букву
extension String {
    var capitalizedSentence: String {
        return "\(prefix(1).capitalized)\(dropFirst().lowercased())"
    }
}
