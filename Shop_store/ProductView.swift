//
//  ProductView.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/25.
//

import SwiftUI

struct ProductView: View {
    
    @State var image = ""
    @State var Itemname = ""
    @State var money:Int = 0
    @State var weight = ""
    @State var supply = ""
    
    var body: some View {
            VStack{
            Image("\(image)")
             .resizable()
             .frame(width: 200, height: 160)
             .cornerRadius(15)
            Rectangle()
             .frame(maxWidth:.infinity )
             .frame(height: 1)
            Spacer()
             .frame(height:20)
            ScrollView(showsIndicators:false) {
                Text("產品名稱：\(Itemname)")
                .modifier(textmod())
                Text("價錢:\(money)")
                .modifier(textmod())
                Text("重量:\(weight)")
                .modifier(textmod())
                Text("青農資訊：\(supply)")
                .modifier(textmod())

            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}

    struct textmod:ViewModifier{
        func body(content: Content) -> some View {
            HStack {
                content
                    .font(.title3)
                .padding(.leading,10)
                .padding(.bottom,5)
                Spacer()
            }
        }
        
    }
