//
//  ErrorView.swift
//  AVOD
//
//  Created by pajonn on 23/05/26.
//

import SwiftUI

struct ErrorView: View {
    
    var errorMsg: String
    
    init(errorMsg: String) {
        self.errorMsg = errorMsg
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Error")
                .font(.title)
            Text(errorMsg)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
