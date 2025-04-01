//
//  FlickrItem.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import Foundation

struct FlickrItem: Identifiable, Codable, Hashable {
    let id: Int?
    let title: String?
    let link: String?
    let media: FlickrMedia?
    let date_taken: String?
    let published: String?
    let description: String?
    let tags: String?
    let author: String?
    let author_id: String?
    
    static func == (lhs: FlickrItem, rhs: FlickrItem) -> Bool {
        return lhs.link == rhs.link
    }
}
