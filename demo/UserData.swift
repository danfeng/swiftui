//
//  UserData.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//
import Combine

class UserData: ObservableObject {
    @Published var recommentPostList: PostListEntity = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostListEntity = loadPostListData("PostListData_hot_1.json")
    
    private var recommentPostDict: [Int: Int] = [:] // id : index
    private var hotPostDict: [Int: Int] = [:] // id : index
    
    init() {
        for i in 0..<recommentPostList.list.count {
            let post = recommentPostList.list[i]
            recommentPostDict[post.id] = i
        }
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDict[post.id] = i
        }
    }
}

extension UserData {
    func postList(for category: PostListCategory) -> PostListEntity {
        switch category {
            case .recommand:
                return recommentPostList
            case .hot:
                return hotPostList
        }
    }
    
    func post(for id: Int) -> PostEntity? {
        if let index = recommentPostDict[id] {
            return recommentPostList.list[index]
        }
        if let index = hotPostDict[id] {
            return hotPostList.list[index]
        }
        return nil
    }
    
    func update(_ post: PostEntity) {
        if let index = recommentPostDict[post.id] {
            recommentPostList.list[index] = post
        }
        if let index = hotPostDict[post.id] {
            hotPostList.list[index] = post
        }
    }
}

enum PostListCategory {
    case recommand, hot
}
