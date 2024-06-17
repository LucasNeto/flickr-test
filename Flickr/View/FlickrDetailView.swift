//
//  FlickrDetailView.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import SwiftUI

struct FlickrDetailView: View {
    @State private var viewModel: FlickrDetailViewModel
    
    init(item: FlickrItem){
        viewModel = FlickrDetailViewModel(item: item)
    }
    
    var body: some View {
        VStack {
            ScrollView{
                FlickrImageView(url: viewModel.item.media?.m)
                Text(viewModel.item.title ?? "").font(.title)
                Text("tags: \(viewModel.item.tags ?? "")")
                Text("author: \(viewModel.item.author ?? "")")
                Text("published date: \(viewModel.item.published?.formatted() ?? "")")
                Spacer(minLength: 36)
                Text(viewModel.item.description ?? "")
            }
        }.padding()
    }
}

#Preview {
    FlickrDetailView(item: FlickrItem(id: 1, title: "", link: "", media: FlickrMedia(m: ""), date_taken: "", published: "", description: "", tags: "", author: "", author_id: ""))
}
