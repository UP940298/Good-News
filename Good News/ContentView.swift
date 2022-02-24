import SwiftUI

struct Article: Codable {
    var id: String
    var Title: String
    var Topic: String
    var Body: String
    var Date: String
    var Image: String
    var Color: String
}

struct ContentView: View {
    
    @State var articles: [Article] = []
    
    @State var showContent = false
        
    var body: some View {
        ScrollView {
           VStack {
              HStack {
                 VStack(alignment: .leading) {
                    Text("Here's some good")
                       .font(.largeTitle)
                       .fontWeight(.heavy)
                 }
                 Spacer()
              }
              .padding(.leading, 60.0)

              ScrollView(.horizontal, showsIndicators: false) {
                 VStack(spacing: 40.0) {
                     ForEach(articles, id: \.Title) { (post) in
                       Button(action: { self.showContent.toggle() }) {
                          GeometryReader { geometry in
                              ArticleView(title: post.Title,
                                        image: post.Image,
                                        color: post.Color)
                                  .rotation3DEffect(Angle(degrees:
                                   Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                                //.sheet(isPresented: self.$showContent) {}
                          }
                          .frame(width: 355, height: 200)
                          .offset(x: -7, y:0)
                       }
                    }
                 }
                 .padding(.leading, 30)
                 .padding(.top, 30)
                 .padding(.bottom, 70)
                 Spacer()
              }
           }
           .padding(.top, 0)
           .onAppear(perform: {
               guard let url: URL = URL(string: "http://localhost/dataFetch.php") else {
                   print("URL is invalid or server is not running.")
                   return
               }
               var urlRequest: URLRequest = URLRequest(url: url)
               urlRequest.httpMethod = "GET"
               URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                   // Check if response is okay
                   guard let data = data else {
                       print("invalid response")
                       return
                   }
                   // Convert JSON response into class model as an array
                   do {
                       self.articles = try JSONDecoder().decode([Article].self, from: data)
                       print(articles)
                   } catch {
                       print(String(describing: error))
                   }
               }).resume()
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
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(20)
            .lineLimit(4)

         Spacer()

            Image(image)
              .resizable()
              .renderingMode(.original)
              .aspectRatio(contentMode: .fit)
              .frame(width: 370, height: 100)
              .padding(.bottom, 30)
      }
      .background(Color(color))
      .cornerRadius(40)
      .frame(width: 370, height: 200)
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
