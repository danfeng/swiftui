//
//  HomeView.swift
//  demo
//
//  Created by sundanlong on 2020/5/21.
//  Copyright © 2020 sundanlong. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var leftPercent: CGFloat = 0
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pageWidth: geometry.size.width,
                                      contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height),
                                      leftPercent: self.$leftPercent) {
                    HStack(spacing: 0) {
                        PostListView(category: .recommand)
                            .frame(width: UIScreen.main.bounds.width)
                        PostListView(category: .hot)
                        .frame(width: UIScreen.main.bounds.width)
                    }.environmentObject(UserData())
                }
            }
            //ScrollView(.horizontal, showsIndicators: false) {
            //    HStack(spacing: 0) {
            //        PostListView(category: .recommand)
            //            .frame(width: UIScreen.main.bounds.width)
            //        PostListView(category: .hot)
            //        .frame(width: UIScreen.main.bounds.width)
            //    }
            //}
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
                .navigationBarTitle("首页", displayMode: .inline)
        }
//    .navigationViewStyle(StackNavigationViewStyle)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
