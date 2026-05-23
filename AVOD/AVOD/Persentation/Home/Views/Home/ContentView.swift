//
//  ContentView.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

import SwiftUI

struct ContentView: View {
    
    var homeData: AVODHomePage
    
    init(homeData: AVODHomePage) {
        self.homeData = homeData
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Sections Count
                    // Sections with Horizontal Scrolling
                    if let sections = homeData.record?.sections {
                        ForEach(sections, id: \.id) { section in
                            SectionRowView(section: section)
                                .padding(.vertical, 8)
                        }
                    }
                }
                .padding()
            }
        }.navigationTitle(homeData.record?.page?.name ?? "HomePage")
    }
}
