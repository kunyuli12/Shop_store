//
//  home_view.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/16.
//

import SwiftUI

struct home_view: View {
    var body: some View {
        VStack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
        Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height:2)
            HStack{
                Spacer()
                NavigationLink{Goods_inform()}
            label:{
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                    .padding()
            }
        }
            VStack{
                Rectangle()
                    .frame(height: 160)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.gray)
                    .cornerRadius(30)
                    .padding(.horizontal,20)
                Rectangle()
                    .frame(height: 160)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.gray)
                    .cornerRadius(30)
                    .padding(.horizontal,20)
                Rectangle()
                    .frame(height: 160)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.gray)
                    .cornerRadius(30)
                    .padding(.horizontal,20)
                Rectangle()
                    .frame(height: 160)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.gray)
                    .cornerRadius(30)
                    .padding(.horizontal,20)
            }
        Spacer()
        }
    }
}

struct home_view_Previews: PreviewProvider {
    static var previews: some View {
        home_view()
    }
}
