import SwiftUI

struct PostExpanded: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            
            Image(article.Image)
                .resizable()
                .frame(height: 200)
            
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

//struct PostExpanded_Previews: PreviewProvider {
//    static var previews: some View {
//        PostExpanded(article: articles[0])
//    }
//}
