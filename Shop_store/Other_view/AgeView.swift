//
//  AgeView.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/2/4.
//

import SwiftUI

struct AgeView: View {
    
    @State var Agelimits = " "
    
    var body: some View {
        HStack{
            Text("年紀")
                .font(.title2)
            Text(Agelimits)
                .font(.title2)
            Text(":")
                .font(.title2)
        }
        .padding(5)
    }
}

struct AgeView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView()
    }
}
