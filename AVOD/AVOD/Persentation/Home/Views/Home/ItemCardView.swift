//
//  ItemCardView.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//
import SwiftUI

struct ItemCardView: View {
    let item: Items
    let aspectRatio: String
    
    // Calculate dimensions based on aspect ratio
    private var cardSize: (width: CGFloat, height: CGFloat) {
        switch aspectRatio {
        case "16x9":
            return (width: 240, height: 140) // 16:9 landscape
        case "2x3":
            return (width: 160, height: 240) // 2:3 portrait
        default:
            return (width: 160, height: 240) // Default portrait
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Image with Badge Overlay
            ZStack(alignment: .bottomLeading) {
                // AsyncImage
                AsyncImage(url: URL(string: item.imageUrl ?? "")) { phase in
                    switch phase {
                    case .empty:
                        // Loading placeholder
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .overlay {
                                Text("No Image")
                            }
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        // Error placeholder
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .overlay {
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            }
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: cardSize.width, height: cardSize.height)
                .cornerRadius(12)
                
                // Badge Overlay (if badges exist)
                if let badges = item.badges, !badges.isEmpty {
                    BadgeView(text: badges.first ?? "")
                        .padding([.leading, .bottom], 8)
                }
            }
            
            // Title
            Text(item.title ?? "Untitled")
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .foregroundColor(.primary)
                .padding(.horizontal, 4)

        }
        .frame(width: cardSize.width)
        .cornerRadius(12)
    }
}

// MARK: - Badge View Component
struct BadgeView: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.caption2)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.yellow)
            .cornerRadius(4)
    }
}
