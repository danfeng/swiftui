//
//  PostDetailView.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    let post: PostEntity
    var body: some View {
        List {
            PostCell(post: post)
            .listRowInsets(EdgeInsets())
            ForEach(1...10, id: \.self) {i in
                Text("评论\(i)")
            }
        }
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PostDetailView(post: userData.recommentPostList.list[0]).environmentObject(userData)
    }
}
