//
//  CommentInputView.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct CommentInputView: View {
    let post: PostEntity
    
    @State private var text: String = ""
    @State private var showEmptyHud: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: UserData
    
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        VStack(spacing: 0) {
            CommentTextView(text: $text, editingWhenAppear: true)
            HStack(spacing: 0) {
                Button(action: {
                    print("点击 评论输入 取消")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("取消").padding()
                }
                
                Spacer()
                
                Button(action: {
                    if self.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        self.showEmptyHud = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.showEmptyHud = false
                        }
                        return
                    }
                    print("点击 评论输入 发送 \(self.text)")
                    var post = self.post
                    post.commentCount += 1
                    self.userData.update(post)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("发送").padding()
                }
            }
            .font(.system(size: 18))
            .foregroundColor(.black)
        }
    .overlay(
        Text("评论不能为空！")
            .scaleEffect(showEmptyHud ? 1: 0.5)
            .animation(.spring(dampingFraction: 0.5))
            .opacity(showEmptyHud ? 1 : 0)
            .animation(.easeInOut)
        )
        .padding(.bottom, keyboardResponder.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardResponder.keyboardShow ? .bottom : [])
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(post: UserData().recommentPostList.list[0])
    }
}
