//
//  String+Extension.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//
import Foundation

extension String {
    func dateFormat(format: String, baseFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = baseFormat
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    var dateFormatted: String {
        return dateFormat(format: "dd/MM - HH'h'mm")
    }
}
