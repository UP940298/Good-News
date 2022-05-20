import SwiftUI

struct ContentView: View {
    
    //Initiate variable and populate with article data.
    //Calls the function to fetch data from database.
    @ObservedObject var articleArray = ArticleViewModel()
    
    var body: some View {
        //A scroll view inside a navigation view allowing the user to scroll through the list of
        // articles and click the article to open a new page.
        NavigationView{
            ScrollView{
                HStack {
                    //Title line above list of articles
                  Text("Here's some good")
                     .font(.title3)
                     .fontWeight(.heavy)
                     .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 2)
                    .background(.white)
                    .padding(.bottom, 20)
                VStack{
                    //Loop through the variable and display each article.
                    //Uses the title of each article as the ID to ensure no duplicates.
                    ForEach(articleArray.articles, id: \.Title) {article in
                        //Dependent on type of article, the expanded view called will be different.
                        //Regardless, the article is rendered as a list item using "PostRow".
                        NavigationLink(destination: {
                            if article.ArType.contains("article") {
                                PostExpandedView(article: article)
                            } else {
                                ImageExpandedView(article: article)
                            }}) {
                                PostRow(article: article)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear() {
                //Calls the function that fetches the data from the database.
                self.articleArray.fetchData()
            }
            .background(
                //Creates a gradient for the background.
                LinearGradient(colors: [Color("background1"),Color("background2")], startPoint: .top, endPoint: .bottom)
            )
        }
        .accentColor(Color("background2"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
