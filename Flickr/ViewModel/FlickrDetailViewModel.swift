//
//  File.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import Foundation

@Observable
class FlickrDetailViewModel {
    var item: FlickrItem
    
    init(item: FlickrItem) {
        self.item = item
    }
}
