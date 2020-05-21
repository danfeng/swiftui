//
//  PostCell.swift
//  demo
//
//  Created by sundanlong on 2020/5/20.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: PostEntity
    
    var bindPost: PostEntity {
        userData.post(for: post.id)!
    }
    
    @EnvironmentObject var userData: UserData
    
    @State var presentComment: Bool = false
    
    var body: some View {
        var post = bindPost
        return VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                post.avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(vip: post.vip)
                            .offset(x: 16, y: 16)
                )
                
                VStack(alignment: HorizontalAlignment.leading, spacing: 5) {
                    Text(post.name)
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                        .lineLimit(0)
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                Spacer()
                Button(action: {
                    post.isFollowed = !post.isFollowed
                    print("点击按钮, -> \(post.followedText)")
                    self.userData.update(post)
                })
                {
                    Text(post.followedText)
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                        .frame(width: 50, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.orange, lineWidth: 1)
                    )
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            Text(post.text)
                .font(.system(size: 17))
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            Divider()
            HStack(spacing: 5) {
                Spacer()
                PostCellToolbar(imageNamed: "message",
                                text: post.commentCountText,
                                color: .black)
                {
                    print("点击了 评论")
                    self.presentComment = true
                }
                .sheet(isPresented: $presentComment)
                {
                    CommentInputView(post: post).environmentObject(self.userData)
                }
                Spacer()
                PostCellToolbar(imageNamed: post.isLiked ? "heart.fill": "heart",
                                text: post.likeCountText,
                                color: post.isLiked ? .red: .black) {
                    print("点击了 关注")
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    } else {
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    self.userData.update(post)
                }
                Spacer()
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238.0/255, green: 238.0/255, blue: 238.0/255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
//        PostCell(post: PostEntity(
//            id: 1,
//            avatar: "76297935ly8g4phfkq68hj20u00u0mzt.jpg",
//            vip: true,
//            name: "用户名称",
//            date: "2020-01-01 00:00",
//            isLiked: false,
//            isFollowed: false,
//            text: "text",
//            images:[],
//            commentCount:0,
//            likeCount:0))
        let userData = UserData()
        return PostCell(post: userData.recommentPostList.list[0]).environmentObject(userData)
    }
}

