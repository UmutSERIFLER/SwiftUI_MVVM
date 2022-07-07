//
//  NewsViewModel.swift
//  SwiftUI_MVVM
//
//  Created by Umut Serifler on 06.07.22.
//

import Foundation
import Combine

protocol NewsViewModelProtocol {
    func getArticles()
}

class NewsViewModel: ObservableObject, NewsViewModelProtocol {
    
    private let service: NewsServiceAPI
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsServiceAPI) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service.request(from: .getNews)
            .sink { result in
                switch result {
                case .finished:
                    self.state = .success(content: self.articles)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: { response in
                self.articles = response.articles
            }

        self.cancellables.insert(cancellable)
        
    }
    
}
