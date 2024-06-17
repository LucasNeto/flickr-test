//
//  FlickrResponse.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import Foundation

struct FlickrResponse: Codable {
    let title: String?
    let link: String?
    let modified: String?
    let description: String?
    let items: [FlickrItem]?
}
