//
//  buybuttom.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/25.
//

import SwiftUI

struct buybuttom: View {
    
    @State var onoff = false
    @State var shownumber = ""
    @State var numbernew = 0
    
    var body: some View {
        Text("\(numbernew)")
    }
}

struct buybuttom_Previews: PreviewProvider {
    static var previews: some View {
        buybuttom()
    }
}
