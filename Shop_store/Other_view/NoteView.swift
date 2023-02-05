//
//  NoteView.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/2/5.
//

import SwiftUI

struct NoteView: View {
    
    @State private var message = ""
    
    var body: some View {
        VStack{
            Text("記事本")
                .font(.largeTitle)
            TextEditor(text: $message)
                .frame(height: 400)
                .padding()
                .border(.black, width: 5)
                .padding(.horizontal,20)
            Text("如：OO小姐，明日早上領取")
                .foregroundColor(.gray)
                .font(.title2)
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
