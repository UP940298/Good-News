import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var topic: String
}

extension Article {
    static let samples = [
        Article(title: "Good news", author: "abc", topic: "Good"),
        Article(title: "Bad news", author: "bcd", topic: "Good"),
        Article(title: "Somewhat news", author: "cde", topic: "Good"),
        Article(title: "Not news", author: "def", topic: "Good"),
        Article(title: "Rubbish", author: "efg", topic: "Good"),
    ]
}

private class ArticlesViewModel: ObservableObject {
    @Published var Articles: [Article] = Article.samples
}

struct ContentView: View {
    @StateObject fileprivate var viewModel = ArticlesViewModel()
    var body: some View {
        List(viewModel.Articles) {article in
            HStack(alignment: .top) {
                  VStack(alignment: .leading) {
                    Text(article.title)
                      .font(.headline)
                    Text("by \(article.author)")
                      .font(.subheadline)
                    Text("\(article.topic)")
                      .font(.subheadline)
                  }
                  Spacer()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
