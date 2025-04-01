//
//  FlickrView.swift
//  Flickr
//
//  Created by Lucas  N Santana on 15/06/24.
//

import SwiftUI

struct FlickrView: View {
    
    @State private var viewModel = FlickrViewModel()
    
    let columns: [GridItem] =
                 Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView{
                if(viewModel.isLoading) {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.items, id: \.self) { item in
                            NavigationLink{
                                FlickrDetailView(item: item)}
                        label: {
                            FlickrImageView(url: item.media?.m)
                        }
                            
                        }
                    }
                    if(viewModel.items.isEmpty) {
                        VStack {
                            Text("Não encontramos resultado com essa pesquisa.")
                                .font(.title)
                            Text(viewModel.errorMessage)
                                .font(.caption)
                                .padding()
                        }
                        .padding()
                            
                    }
                }
                
            } .padding()
            .navigationTitle("Flickr Images")
        }
        .searchable(text: $viewModel.searchText)
        .onAppear(perform: viewModel.runSearch)
        .onSubmit(of: .search, viewModel.runSearch)
        .onChange(of: viewModel.searchText, viewModel.runSearch)
    }
}

#Preview {
    FlickrView()
}
