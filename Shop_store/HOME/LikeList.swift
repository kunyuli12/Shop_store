//
//  LikeList.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/30.
//

import SwiftUI

struct LikeList: View {
    var body: some View {
        VStack {
            Text("我的最愛")
                .font(.title)
            Rectangle()
                .frame(maxWidth:.infinity)
                .frame(height:1.5)
            Spacer()
        }
    }
}

struct LikeList_Previews: PreviewProvider {
    static var previews: some View {
        LikeList()
    }
}
