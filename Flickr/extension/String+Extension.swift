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
    
    func formatted() -> String {
        return dateFormat(format: "dd/MM - HH'h'mm")
    }
    
    var htmlFormatted: String? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
        } catch {
            return  nil
        }
    }
}
