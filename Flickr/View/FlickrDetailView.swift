//
//  FlickrDetailView.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import SwiftUI

struct FlickrDetailView: View {
    @State private var viewModel: FlickrDetailViewModel
    
    @Environment(\.openURL) private var openURL

    
    init(item: FlickrItem){
        viewModel = FlickrDetailViewModel(item: item)
    }
    
    var body: some View {
        VStack {
            ScrollView{
                
                FlickrImageView(url: viewModel.item.media?.m)
                VStack(alignment: .leading) {
                    Text(viewModel.item.title ?? "").font(.title)
                    Text("Tags:").font(.headline)
                    Text(viewModel.item.tags ?? "")
                    Text("Author:").font(.headline)
                    Text(viewModel.item.author ?? "")
                    Text("Date Taken:").font(.headline)
                    Text(viewModel.item.date_taken?.dateFormatted ?? "")
                    Text("Published date:").font(.headline)
                    Text(viewModel.item.published?.dateFormatted ?? "")
                    Spacer(minLength: 36)
                    Text("Description:").font(.headline)
                    Text(viewModel.item.description ?? "").font(.caption)
                    Spacer(minLength: 36)
                    Button {
                        if let url = URL(string: viewModel.item.link ?? "") {
                            openURL(url)
                        }
                    } label: {
                        Text("Open the link")
                    }
                    
                }
            }
        }.padding()
    }
}

#Preview {
    FlickrDetailView(item: FlickrItem(
        id: 1,
        title: "Flickr Title",
        link: "",
        media: FlickrMedia(m: "https://live.staticflickr.com/65535/54425278735_f90aa9e8d4_m.jpg"),
        date_taken: "2025-04-01T01:00:00-03:00",
        published: "2025-04-01T01:00:00Z",
        description: "<p><a href=\"https://www.flickr.com/people/fotosdozecom/\">fotosdoze.com</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/fotosdozecom/54425281705/\" title=\"250329-00145\"><img src=\"https://live.staticflickr.com/65535/54425281705_b15bacb231_m.jpg\" width=\"240\" height=\"160\" alt=\"250329-00145\" /></a></p> <p>fotosdoze.com ze@fotosdoze.com</p> ",
        tags: "monsaraz évora portugal",
        author: "ze@fotosdoze.com",
        author_id: "148650098@N06"))
}
