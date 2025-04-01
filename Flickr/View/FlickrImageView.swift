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
                case .failure:
                    Image("empty")
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    Image("empty")
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(idealHeight: 200)
            .padding()
        }
    }
}


#Preview {
    FlickrImageView(url: "https://live.staticflickr.com/65535/54425278735_f90aa9e8d4_m.jpg")
}
