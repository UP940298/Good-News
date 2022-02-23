

import SwiftUI

//Create class model that will store the raw data from the PHP fetch.
class Article_model: Codable, Identifiable {
    var ID: String? = ""
    var Title: String? = ""
    var Topic: String? = ""
    var Body: String? = ""
    var Date: String? = ""
}

struct ContentView: View {
    @State var articles: [Article_model] = []
    
    var body: some View {
        VStack {
                List (self.articles) { (article) in
                    HStack {
                        // Display the title and topics
                        Text(article.Title ?? "").edgesIgnoringSafeArea(.horizontal)
                        Spacer()
                        Text(article.Date ?? "").edgesIgnoringSafeArea(.horizontal)
                    }
                }.listStyle(GroupedListStyle()).refreshable {
                    print("To do.")
                }
        }
        .edgesIgnoringSafeArea(.horizontal)
        .onAppear(perform: {
                // Send request to server
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
                        self.articles = try JSONDecoder().decode([Article_model].self, from: data)
                    } catch {
                        print(String(describing: error))
                    }
                }).resume()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
