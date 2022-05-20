import Foundation
import Firebase
import FirebaseAnalytics
import FirebaseFirestore

class ArticleViewModel: ObservableObject {
    
    //Creates an array of articles.
    @Published var articles = [Article]()

    //Initializes the database.
    private var db = Firestore.firestore()

    //Function to fetch the data from the database.
    func fetchData() {

        //This command returns all of the articles stored into the Article array.
        db.collection("articles").addSnapshotListener { (querySnapshot, error) in guard let documents = querySnapshot?.documents else {
                print("Couldn't connect to that collection.")
                return
            }
            //Takes the specific entries from the collection that are needed.
            self.articles = documents.map{ queryDocumentSnapshot -> Article in
            let data = queryDocumentSnapshot.data()
            let Title = data["Title"] as? String ?? ""
            let Author = data["Author"] as? String ?? ""
            let Body = data["Body"] as? String ?? ""
            let ArType = data["ArType"] as? String ?? ""
            let Date = data["Date"] as? String ?? ""
            let Link = data["Link"] as? String ?? ""
            let Image = data["Image"] as? String ?? ""
            let Color = data["Color"] as? String ?? ""

                return Article(id: .init(), Title: Title, Author: Author, ArType: ArType, Body: Body, Date: Date, Link: Link, Image: Image, Color: Color)
            }
        }
    }
}
