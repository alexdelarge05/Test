//
//  ContentView.swift
//  TestCloud
//
//  Created by Алексей Петров on 23.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: ContentViewModel = ContentViewModel()
    
    
    var listView: AnyView {
        if model.comments.isEmpty {
            return AnyView(emptyView)
        } else {
            return AnyView(commentsListView)
        }
    }

    var emptyView: some View {
        EmptyView {
            self.model.fetch()
        }
    }

    var commentsListView: some View {
        List(model.comments, id: \.id) { comment in
            CommentView(model: CommentViewModel(model: comment))
                .padding(.bottom, 10)
        }
    }
    
    var body: some View {
       listView
        .onAppear {
            self.model.fetch()
        }
        .alert(isPresented: $model.isError) { () -> Alert in
            Alert(
                title: Text("Error!"),
                message: Text(self.model.error!.localizedDescription),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
