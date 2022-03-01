import SwiftUI
import Firebase
import FirebaseAnalytics
import FirebaseFirestore

struct Article: Identifiable {
    var id: String
    var Title: String
    var Author: String
    var ArType: String
    var Body: String
    var Date: String
    var Image: String
    var Color: String
}

class ArticleViewModel: ObservableObject{
    @Published var articles = [Article]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        
        //db.collection("articles").addDocument(data: ["Title": "Good news", "Author": "Thomas Percival", "Body": "", "ArType": "article", "Date":"2022-02-28", "Image":"", "Color":"background1"])

        db.collection("articles").addSnapshotListener { (querySnapshot, error) in guard let documents = querySnapshot?.documents else {
                print("nah")
                return
            }

            self.articles = documents.map{ queryDocumentSnapshot -> Article in
                let data = queryDocumentSnapshot.data()
                let Title = data["Title"] as? String ?? ""
                let Author = data["Author"] as? String ?? ""
                let Body = data["Body"] as? String ?? ""
                let ArType = data["Type"] as? String ?? ""
                let Date = data["Date"] as? String ?? ""
                let Image = data["Image"] as? String ?? ""
                let Color = data["Color"] as? String ?? ""

                return Article(id: .init(), Title: Title, Author: Author, ArType: ArType, Body: Body, Date: Date, Image: Image, Color: Color)
            }
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ArticleViewModel()
        
    @State var showContent = false
        
    var body: some View {
        VStack {
          Text("Here's some good")
             .font(.largeTitle)
             .fontWeight(.heavy)
            ScrollView(.vertical, showsIndicators: false) {
                 VStack(spacing: 30.0) {
                     ForEach(viewModel.articles, id: \.Title) { (post) in
                       Button(action: { self.showContent.toggle() }) {
                          GeometryReader { geometry in
                              ArticleView(title: post.Title,
                                        image: post.Image,
                                        color: post.Color)
                                  .rotation3DEffect(Angle(degrees:
                                   Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                //.sheet(isPresented: self.$showContent) {}
                          }
                          .frame(width: 400, height: 20)
                          .offset(x: -10, y:0)
                       }
                    }
                 }
                 .padding(.leading, 45)
                 .padding(.top, 20)
                 .padding(.bottom, 70)
                 Spacer()
              }
              .onAppear(perform: {
               self.viewModel.fetchData()
        })
        }
    }
}

struct ArticleView: View {

   var title = "Good news"
   var image = "Illustration1"
   var color = "background6"

   var body: some View {
      return VStack(alignment: .leading) {
         Text(title)
              .font(Font.custom("Arial", size: 16))
            .foregroundColor(.white)
            .padding(10)
         Spacer()
            Image(image)
              .frame(width: 400, height: 0)
      }
      .background(Color(color))
      .cornerRadius(10)
      .frame(width: 375, height: 20)
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
