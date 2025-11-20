//
//  ShareView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//
import SwiftUI

struct ShareView: View {
    @StateObject var ShareVM = ShareViewModel()
    var currentUserRole = 3
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 0){
                        ForEach(ShareVM.Sharearr){item in
                            Divider()
                            NavigationLink(destination : ShareDetailView(DetailVM: ShareVM, id: item.id, userRole: 1)){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("\(item.title)")
                                            .font(.regular(22))
                                            .foregroundStyle(.black)
                                            .padding(.bottom,4)
                                        Text(item.author)
                                            .foregroundStyle(.gray.opacity(0.7))
                                    }
                                    .padding(.leading,11)
                                    .padding(.vertical,10)
                                    
                                    Spacer()
                                    Image("Sample")
                                        .resizable()
                                        .frame(width: 54,height: 44)
                                        .cornerRadius(12)
                                        .padding(.trailing,19)
                                    
                                }
                                
                                .frame(maxWidth: .infinity, maxHeight: 74)
                            }
                            Divider()
                            
                            
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: CreatePostView(viewModel: ShareVM, endpoint: "etcInfo/post")) {
                            Image(systemName: "plus")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 64, height: 64)
                                .background(Color.main)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            Task{
                await ShareVM.fetchList()
            }
        }
    }
}


#Preview {
    ShareView()
}

//VStack(spacing: 7) {
//                        ForEach(viewModel.Sharearr, id:\.self) { item in
//                            NavigationLink(destination: ShareDetailView(), isActive: <#T##Binding<Bool>#>, label: <#T##() -> View#>) {
//                                <#code#>
//                            }
//                            NavigationLink(destination: ShareDetailView(item: item, userRole: currentUserRole)) {
//                                HStack {
//                                    VStack(alignment: .leading, spacing: 8) {
//                                        Text("\(item.title)")
//                                            .font(.headline)
//                                            .foregroundColor(.primary)
//                                        Text(item.isAnonymous ? "익명" : item.subtitle)
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                    }
//                                    Spacer()
//                                    if let image = item.image {
//                                        Image(uiImage: image)
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 45, height: 45)
//                                            .clipShape(RoundedRectangle(cornerRadius: 12))
//                                    } else {
//                                        Image(systemName: "photo.fill")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 45, height: 12)
//                                            .padding(.vertical, 15)
//                                            .background(Color.gray.opacity(0.3))
//                                            .clipShape(RoundedRectangle(cornerRadius: 12))
//                                    }
//                                }
//                                .padding(.horizontal)
//                                .padding(.vertical, 8)
//                            }
//                            Text("\(viewModel.Sharearr)")
