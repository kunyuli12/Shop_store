//
//  Shop_View.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/30.
//

import SwiftUI

struct Shop_View: View {

    var body: some View {
        VStack{
        Text("Test View")
            .foregroundColor(.white)
            .font(.title2)
            .frame(width: 180, height: 180, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [Color("healthybuttom"), Color("yellowlight")]), startPoint:.topLeading, endPoint:.bottomTrailing))
            .cornerRadius(20)
            Text("Test View")
                .foregroundColor(.white)
                .font(.title2)
                .frame(width: 180, height: 180, alignment: .center)
                .background(Color(.gray))
                .cornerRadius(20)
        }
    }
}

struct Shop_View_Previews: PreviewProvider {
    static var previews: some View {
        Shop_View()
    }
}
