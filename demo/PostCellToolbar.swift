//
//  PostCellToolbar.swift
//  demo
//
//  Created by sundanlong on 2020/5/20.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct PostCellToolbar: View {
    let imageNamed: String
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: imageNamed)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbar_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbar(imageNamed: "heart", text: "点赞", color: .red, action: {
            print("点击了 点赞")
        })
    }
}
