//
//  HomeNavigationBar.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeigth: CGFloat = 24

struct HomeNavigationBar: View {
    @Binding var leftPercent: CGFloat // 0 - left; 1 - rigth
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("点击相机按钮")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeigth, height: kButtonHeigth)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
                
            }
            Spacer()
                    VStack(spacing: 3) {
                        HStack(spacing: 0) {
                            Text("推荐")
                                .bold()
                                .frame(width: kLabelWidth, height: kButtonHeigth)
                                .padding(.top, 5)
                                .opacity(Double(1 - leftPercent * 0.5))
                                .onTapGesture {
                                    withAnimation {
                                        self.leftPercent = 0
                                    }
                            }
                            Spacer()
                            Text("热门")
                                .bold()
                                .frame(width: kLabelWidth, height: kButtonHeigth)
                                .padding(.top, 5)
                                .opacity(Double(0.5 + leftPercent * 0.5))
                                .onTapGesture {
                                    withAnimation {
                                        self.leftPercent = 1
                                    }
                            }
                        }
                        .font(.system(size: 20))
                        
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(.orange)
                                .frame(width: 30, height: 4)
                                .offset(x: geometry.size.width * (self.leftPercent - 0.5) + CGFloat(kLabelWidth * (0.5 - self.leftPercent)))
                        }
                        .frame(height: 6)
            //            RoundedRectangle(cornerRadius: 2)
            //                .foregroundColor(.orange)
            //                .frame(width: 30, height: 4)
            //                .offset(x: UIScreen.main.bounds.width * 0.5 * (self.leftPercent - 0.5) + CGFloat(kLabelWidth * (0.5 - self.leftPercent)))
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.5)
            Spacer()
            
            Button(action: {
                print("点击+按钮")
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeigth, height: kButtonHeigth)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }
            
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: .constant(0))
    }
}
