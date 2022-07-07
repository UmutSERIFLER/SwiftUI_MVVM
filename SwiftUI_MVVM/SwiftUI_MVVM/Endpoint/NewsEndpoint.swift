//
//  NewsEndpoint.swift
//  SwiftUI_MVVM
//
//  Created by Umut Serifler on 06.07.22.
//

import Foundation

//MARK: API Builder Protocol
protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}


enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    
}
