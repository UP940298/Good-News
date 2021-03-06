import SwiftUI

//Creates the view of the expanded article. This shows when an article is clicked, not an image.
struct PostExpandedView: View {
    var article: Article
    
    
    var body: some View {
        ScrollView {
            
            AsyncImage(url: URL(string: article.Image)){ image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }
            .frame(width: 100, height: 200, alignment: .center)
            
            VStack(alignment: .leading) {
                
                Text(article.Title)
                    .font(.title)
                    .offset(y: -10)
                
                HStack() {
                    Text(article.Author)
                    Spacer()
                    Text(article.Date)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(article.Body)
            }
            .padding()
        }
    }
}
