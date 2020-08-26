//
//  ContentViewModel.swift
//  TestCloud
//
//  Created by Алексей Петров on 23.08.2020.
//  Copyright © 2020 Алексей Петров. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ContentViewModel: ObservableObject {
   
    @Published var error: Error? {
        didSet {
            isError = error != nil
        }
    }
    @Published var isError: Bool = false
    @Published var comments: [Comment] = []
    
    func fetch() {
        Comments.shared.fetch { (result) in
            switch result {
            case .success(let comments):
                self.comments = comments
            case .failure(let error):
                self.error = error
            }
        }
    }
    
}
