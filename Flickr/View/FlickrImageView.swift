//
//  FlickrImageView.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import SwiftUI

struct FlickrImageView: View {
    var url: String?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: url ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 200, maxHeight: 200)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}


#Preview {
    FlickrImageView()
}
