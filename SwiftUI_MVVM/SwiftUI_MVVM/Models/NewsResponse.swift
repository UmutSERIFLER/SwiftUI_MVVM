//
//  NewsResponse.swift
//  SwiftUI_MVVM
//
//  Created by Umut Serifler on 06.07.22.
//

import Foundation

//MARK: - News Response Model
struct NewsResponse: Decodable {
    let articles: [Article]
}


//MARK: Article
struct Article: Decodable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String
    let source, title, articleDescription: String
    let image: String
    let date: String
    
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
    
}

extension Article {
    static var dummyData: Article {
        .init(author: "Umut SERIFLER",
              url: "Umut URL",
              source: "Umut Source",
              title: "Umut Title",
              articleDescription: "Umut Description",
              image: "Umut Image",
              date: "")
    }
}
