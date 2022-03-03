import SwiftUI

struct PostRow: View {
    var article: Article
    
    var body: some View {
        ZStack{
            HStack{
                Image("")
                    .frame(width: 100, height: 100)
                    .offset()
                Text(article.Title)
                    .font(Font.custom("Arial", size: 15))
                    .foregroundColor(.white)
                    .offset(x: 0, y:0)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width:250)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .background(.gray)
            .frame(width: 390, height: 100)
            .fixedSize(horizontal: true, vertical: true)
            Text(article.ArType)
                .font(Font.custom("Arial", size: 10))
                .foregroundColor(.white)
                .offset(x: -70, y:-40)
            Text(article.Date)
                .font(Font.custom("Arial", size: 10))
                .foregroundColor(.white)
                .offset(x: 160, y: -40)
        }
    }
}

//struct PostRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            PostRow(article: articles[8])
//            PostRow(article: articles[0])
//        }
//    }
//}
