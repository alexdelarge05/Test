//
//  CommentViewModel.swift
//  TestCloud
//
//  Created by Алексей Петров on 25.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class CommentViewModel: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var body: String
    @Published var stringCount: Int?
    
    init(model: Comment) {
        self.name = model.name
        self.email = model.email
        self.body = model.body
        self.stringCount = model.bodyCount
    }
}
