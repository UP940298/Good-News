import Foundation
import Firebase
import FirebaseAnalytics
import FirebaseFirestore

class ArticleViewModel: ObservableObject {
    
    @Published var articles = [Article]()

    private var db = Firestore.firestore()

    func fetchData() {

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
            
            print(self.articles)
        }
    }
}
