//
//  FlickrService.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import Foundation

struct FlickrService: BaseService {
    
    var baseUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    
    func searchText(_ text: String, completion: @escaping (Result<FlickrResponse, Error>) -> Void) {
        // Invalidade requests that is running.
        urlSessionShared.invalidateAndCancel()
        
        guard let url = URL(string: "\(baseUrl)\(text)") else {
            completion(.failure(NSError(domain: "Bad url", code: -1)))
            return
        }
        request(url: url, completion: completion)
    }
    
}
