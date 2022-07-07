//
//  ArticleView.swift
//  SwiftUI_MVVM
//
//  Created by Umut Serifler on 06.07.22.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url) { error, _ in
                    PlaceHolderImageview()
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceHolderImageview()
            }
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source)
                    .foregroundColor(.gray)
                    .font(.footnote)
            })
        }
    }
}

struct PlaceHolderImageview: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
