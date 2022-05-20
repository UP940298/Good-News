import SwiftUI

//Creates the expanded view for any posts that are images.
//This is practically just a larger version of the image with little to no text.
struct ImageExpandedView: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            
            AsyncImage(url: URL(string: article.Image)){ image in image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 400, height: 400, alignment: .center)
            
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
