//
//  CommentView.swift
//  TestCloud
//
//  Created by Алексей Петров on 25.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    
    @ObservedObject var model: CommentViewModel
    @Environment(\.verticalSizeClass) var verticalSize
    
    private var bodyView: some View {
        HStack(alignment: .center) {
            Text(model.body)
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            if model.stringCount != nil && verticalSize == .compact {
                Text("\(model.stringCount!)")
                    .font(.system(size: 13))
                    .frame(height: 20)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        
    }
    
    private var nameView: some View {
    
        HStack(alignment: .center) {
            Text(model.name)
                .font(Font.system(size: 18).weight(.medium))
                .foregroundColor(.black)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .leading
                )

            if model.stringCount != nil {
                Text("\(model.stringCount!)")
                    .font(.system(size: 13))
                    .frame(height: 20)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            if verticalSize == .regular {
                
                nameView
                
                Text(model.email)
                .font(.system(size: 17))
                .foregroundColor(.gray)
                
                bodyView
                
                
            } else {
                bodyView
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.black.opacity(0.1))
        .cornerRadius(8)
    }
}

