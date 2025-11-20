//
//  etcInfoDetailView.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI

struct etcInfoDetailView: View {
    let item: etcInfoModel
    let userRole: Int
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 7) {
                            HStack(spacing: 4) {
                                Image(systemName: "tag")
                                    .font(.system(size: 15))
                                    .foregroundColor(.orange)
                                Text(item.category)
                                    .font(.title3)
                                    .foregroundColor(.orange)
                            }
                            
                            Text(item.title)
                                .font(.title2)
                                .bold()
                            
                            HStack(spacing: 12) {
                                Image(systemName: "person.crop.circle")
                                    .font(.system(size: 22))
                                    .foregroundColor(.gray)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.isAnonymous ? "익명" : item.subtitle)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(item.date, formatter: dateFormatter)
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.top, 32)
                        .padding(.leading, 20)
                        .padding(.horizontal, 20)
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                        .padding(.horizontal, 37)
                    
                    if let image = item.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(16)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.1))
                            Image(systemName: "photo")
                                .scaledToFit()
                                .foregroundColor(.gray.opacity(0.7))
                                .frame(width: 80, height: 80)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                    }
                    
                    Text(item.content)
                        .font(.body)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                        .padding(.leading, 20)
                    
                    Spacer(minLength: 40)
                }
                .background(Color.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3))
                        .background(Color.white)
                )
                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 0)
                .padding(.horizontal, 22)
//                .frame(height: 548)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()
}
