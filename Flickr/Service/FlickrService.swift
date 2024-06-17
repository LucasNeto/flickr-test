//
//  FlickrService.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import Foundation

struct FlickrService {
    
    var baseUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    
    func searchText(_ text: String, completion: @escaping (Result<FlickrResponse, Error>) -> Void) {
        Task {
            do {
                guard let url = URL(string: "\(baseUrl)\(text)") else {
                    completion(.failure(NSError(domain: "bad url", code: -1)))
                    return
                }
                
                let (data, _) = try await URLSession.shared.data(from: url)
                completion(.success(try JSONDecoder().decode(FlickrResponse.self, from: data)))
                return
                
            }catch{
                completion(.failure(error))
            }
        }
    }
    
}
