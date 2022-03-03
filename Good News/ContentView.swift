import SwiftUI

struct ContentView: View {
    
    @ObservedObject var articleView = ArticleViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack {
                  Text("Here's some good")
                     .font(.title3)
                }
                Divider()
                VStack{
                    ForEach(articleView.articles, id: \.Title) {article in
                        NavigationLink(destination: PostExpanded(article: article)) {
                                PostRow(article: article)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear() {
                self.articleView.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
