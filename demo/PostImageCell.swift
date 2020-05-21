//
//  PostImageCell.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI
private let kImageSpace: CGFloat = 6
struct PostImageCell: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        Group {
            if images.count == 1 {
                Image(uiImage: UIImage(named: images[0])!)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width * 0.75)
                .clipped()
            } else if images.count == 2 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 3 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 4 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
            } else if images.count == 5 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
                
            } else if images.count == 6 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
                
            } else {
                
            }
        }
    }
}

struct PostImageCellRow: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        let colWidth = (width - kImageSpace * CGFloat(images.count - 1)) / CGFloat(images.count)
        return HStack(spacing: kImageSpace) {
            ForEach(images, id: \.self) {image in
                Image(uiImage: UIImage(named: image)!)
                .resizable()
                .scaledToFill()
                    .frame(width: colWidth, height: colWidth)
                .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        let images = userData.recommentPostList.list[0].images
        let width = UIScreen.main.bounds.width - 30
        return Group {
            PostImageCell(images: Array(images[0...0]), width: width)
            PostImageCell(images: Array(images[0...1]), width: width)
            PostImageCell(images: Array(images[0...2]), width: width)
            PostImageCell(images: Array(images[0...3]), width: width)
            PostImageCell(images: Array(images[0...4]), width: width)
            PostImageCell(images: Array(images[0...5]), width: width)
        }
        .previewLayout(PreviewLayout.fixed(width: UIScreen.main.bounds.width, height: 400))
    }
}
