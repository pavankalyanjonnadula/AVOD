//
//  SectionRowView.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//


import SwiftUI

struct SectionRowView: View {
    let section: Sections
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section Header
            HStack {
                Text(section.name ?? "Section")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            // Horizontal Scroll of Items
            // Horizontal Scroll of Items
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    if let items = section.items {
                        ForEach(items, id: \.id) { item in
                            ItemCardView(
                                item: item,
                                aspectRatio: section.collection?.imageAspectRatio ?? "2x3"
                            )
                        }
                    }
                }
                .padding(.horizontal)
            }        }
    }
}
