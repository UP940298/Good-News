import SwiftUI

//Creates an expanded view of the article if it is a video. 
struct VideoExpandedView: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            
            Image(article.Image)
                .resizable()
                .frame(height: 600)
            
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
