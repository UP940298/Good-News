import SwiftUI

//Creates the item that is rendered in the list on the main screen.
struct PostRow: View {
    //Create an article variable.
    var article: Article
    
    var body: some View {
        ZStack{
            HStack{
                //Horizontally aligned image and title of the headline.
                AsyncImage(url: URL(string: article.Image)){ image in image
                        .resizable()
                } placeholder: {
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                .frame(width: 100, height: 100)
                    .offset()
                Text(article.Title)
                    .font(Font.custom("Arial", size: 15))
                    .foregroundColor(.black)
                    .offset(x: 0, y:0)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width:250)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .background(.white)
            .frame(width: 380, height: 100)
            .fixedSize(horizontal: true, vertical: true)
            .cornerRadius(15)
            .clipped()
            .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
        .padding(.bottom, 10)
    }
}
