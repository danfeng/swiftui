//
//  PostListView.swift
//  demo
//
//  Created by sundanlong on 2020/5/20.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    let category: PostListCategory
    //var postList: PostListEntity {
    //    switch category {
    //    case .recommand:
    //        return loadPostListData("PostListData_recommend_1.json")
    //    case .hot:
    //        return loadPostListData("PostListData_hot_1.json")
    //    }
    //}
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            
            ForEach(userData.postList(for: category).list) { post in
            // ForEach(postList.list, id: \.id) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommand)
            .navigationBarTitle("Title")
            .navigationBarHidden(true)
        }.environmentObject(UserData())
    }
}
