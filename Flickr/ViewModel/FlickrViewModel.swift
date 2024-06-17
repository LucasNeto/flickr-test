//
//  FlickrViewModel.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import SwiftUI

@Observable
class FlickrViewModel {
    var items = [FlickrItem]()
    var searchText = ""
    var isLoading = false
    private let service = FlickrService()
    
    func runSearch() {
        isLoading = true
        service.searchText(searchText) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let response):
                self?.items = response.items ?? []
            default:
                break
            }
        }
    }
}
