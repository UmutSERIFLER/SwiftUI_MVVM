//
//  ResultState.swift
//  SwiftUI_MVVM
//
//  Created by Umut Serifler on 06.07.22.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
