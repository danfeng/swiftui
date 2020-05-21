//
//  Post.swift
//  demo
//
//  Created by sundanlong on 2020/5/20.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct PostListEntity: Codable {
    var list: [PostEntity]
}

// Data model
struct PostEntity: Codable, Identifiable {
    let id: Int
    let avatar: String // 头像，图片名称
    let vip: Bool
    let name: String
    let date: String
    var isLiked: Bool
    var isFollowed: Bool
    
    let text: String // 文字内容
    let images: [String]
    
    var commentCount: Int
    var likeCount: Int
}

// 扩展字段
extension PostEntity {
    var avatarImage: Image {
        return Image(uiImage: UIImage(named: avatar)!)
    }
    var commentCountText: String {
        if commentCount <= 0 {
            return "评论"
        } else if commentCount < 1000 {
            return "\(commentCount)"
        } else {
            return String(format: "%.1fK", Double(commentCount)/1000)
        }
    }
    var likeCountText: String {
        if likeCount <= 0 {
            return "点赞"
        } else if likeCount < 1000 {
            return "\(likeCount)"
        } else {
            return String(format: "%.1fK", Double(likeCount)/1000)
        }
    }
    var followedText: String {
        if isFollowed {
            return "取消"
        } else {
            return "关注"
        }
    }
}

func loadPostListData(_ fileName: String) -> PostListEntity {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("数据文件\(fileName)不存在！")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("数据文件\(fileName)加载失败！")
    }
    guard let json = try? JSONDecoder().decode(PostListEntity.self, from: data) else {
        fatalError("数据文件\(fileName)解析失败！")
    }
    return json
}

//func loadImage(named: String) -> Image {
//    return Image(uiImage: UIImage(named: name)!)
//}

