//
//  PostVIPBadge.swift
//  demo
//
//  Created by sundanlong on 2020/5/20.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct PostVIPBadge: View {
    let vip: Bool
    
    var body: some View {
        Group {
            if vip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(.orange)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                        .stroke(Color.white, lineWidth: 1)
                )
            }
        }
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge(vip: true)
    }
}
