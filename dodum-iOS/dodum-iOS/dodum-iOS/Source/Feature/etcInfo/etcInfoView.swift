//
//  etcInfoView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct etcInfoView: View {
    @StateObject private var viewModel = etcInfoViewModel()
    @State private var selectedTab: String = "전체"
    @State private var tabWidths: [String: CGFloat] = [:]
    let tabs = ["전체", "학교지원", "개발도구", "강의추천"]
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        Button(action: { selectedTab = tab }) {
                            VStack(spacing: 6) {
                                Text(tab)
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(selectedTab == tab ? Color.main : .gray)
                                    .fixedSize()
                                    .background(
                                        GeometryReader { proxy in
                                            Color.clear.preference(
                                                key: TabWidthPreferenceKey.self,
                                                value: [tab: proxy.size.width]
                                            )
                                        }
                                    )
                                
                                Rectangle()
                                    .frame(width: selectedTab == tab ? (tabWidths[tab] ?? 0) : 0, height: 2)
                                    .foregroundColor(selectedTab == tab ? Color.main : .clear)
                                    .animation(.easeInOut(duration: 0.2), value: selectedTab)
                                    .animation(.easeInOut(duration: 0.2), value: tabWidths)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.vertical, 10)
                .background(Color.white)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.2)),
                    alignment: .bottom
                )
                .onPreferenceChange(TabWidthPreferenceKey.self) { widths in
                    tabWidths = widths
                }

                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(viewModel.Sharearr) { item in
                            NavigationLink(destination: etcInfoDetailView(item: item, userRole: 1)) {
                                HStack(alignment: .center) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack {
                                            Text(item.title)
                                                .font(.system(size: 18, weight: .semibold))
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                .frame(maxWidth: UIScreen.main.bounds.width * 0.3, alignment: .leading)
                                            
                                            Text(item.category)
                                                .font(.system(size: 13, weight: .medium))
                                                .foregroundColor(.orange)
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 4)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .stroke(Color.orange, lineWidth: 1)
                                                )
                                                .fixedSize()
                                        }
                                        Text("이름")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    if let image = item.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 45, height: 45)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .padding(.trailing, 20)
                                    } else {
                                        Image(systemName: "photo.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 45, height: 12)
                                            .padding(.vertical, 15)
                                            .background(Color.gray.opacity(0.3))
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .padding(.trailing, 20)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                            }
                            Divider()
                        }
                    }
                }
            }
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: PostComposeView(viewModel: viewModel)) {
                            Image(systemName: "plus")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 64, height: 64)
                                .background(Color.main)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.bottom, 18)
                        .padding(.trailing, 18)
                    }
                }
            )
            .navigationBarHidden(true)
        }
    }
    
    struct TabWidthPreferenceKey: PreferenceKey {
        static var defaultValue: [String: CGFloat] = [:]
        static func reduce(value: inout [String: CGFloat], nextValue: () -> [String: CGFloat]) {
            value.merge(nextValue(), uniquingKeysWith: { $1 })
        }
    }
}

#Preview {
    etcInfoView()
}
