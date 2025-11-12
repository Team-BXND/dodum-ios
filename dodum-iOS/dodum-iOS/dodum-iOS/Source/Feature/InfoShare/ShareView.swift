//
//  ShareView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct ShareView: View {
    @StateObject private var viewModel = ShareViewModel()
    var currentUserRole = 3
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 7) {
                        ForEach(viewModel.Sharearr.filter { $0.authorRole == 2 || currentUserRole == 3 }) { item in
                            NavigationLink(destination: ShareDetailView(item: item, userRole: currentUserRole)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(item.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Text(item.isAnonymous ? "익명" : item.subtitle)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.leading, 11.5)
                                    
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
                                            .foregroundColor(.white)
                                            .frame(width: 45, height: 12)
                                            .padding(.vertical, 15)
                                            .background(Color.gray.opacity(0.3))
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .padding(.trailing, 20)
                                    }
                                }
                                .foregroundColor(Color.gray.opacity(0.2))
                                .padding(.leading, 11.5)
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                            }
                            Divider()
                        }
                    }
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.2)),
                        alignment: .top
                    )
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                NavigationLink(destination: CreatePostView(endpoint: "etcInfo/post")) {
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
                        .navigationBarHidden(true)
                    }
                }
            }
        }
    }
}

#Preview {
    ShareView()
}
