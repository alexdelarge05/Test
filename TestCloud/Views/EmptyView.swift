//
//  EmptyView.swift
//  TestCloud
//
//  Created by Алексей Петров on 26.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import SwiftUI

struct EmptyView: View {
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Sorry")
                .font(Font.system(size: 52).weight(.heavy))
                .foregroundColor(.black)
            
            Text("list is empty")
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
                .foregroundColor(Color.black.opacity(0.4))
            
            Spacer()
                .frame(height: 40)
            
            Button(action: {
                self.action()
            }) {
                Text("Repead")
                .font(Font.system(size: 15).weight(.medium))
                .foregroundColor(.blue)
            }
               
        }
        .padding(.all, 40)
    }
}

