import SwiftUI

struct ArchiveView: View {
    enum ArchiveCategory: String, CaseIterable {
        case club = "동아리"
        case narsha = "나르샤"
        case award = "대회수상작"
        case project = "미니프로젝트"
    }
    
    @State private var goToAdd = false
    @State private var selectedCategory: ArchiveCategory = .club
    
    var club: ArchiveModel = ArchiveModel(title: "도담도담", subtitle: "바인드", content: "내용")
    var narsha: ArchiveModel = ArchiveModel(title: "나르샤 제목", subtitle: "제작자", content: "내용")
    var award: ArchiveModel = ArchiveModel(title: "팀명", subtitle: "수상종류", content: "내용")
    var project: ArchiveModel = ArchiveModel(title: "프로젝트명", subtitle: "제작연도", content: "내용")
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack(spacing: 28) {
                        ForEach(ArchiveCategory.allCases, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.rawValue)
                                    .foregroundColor(selectedCategory == category ? .main : .gray)
                                    .fontWeight(selectedCategory == category ? .bold : .regular)
                            }
                        }
                    }
                    .padding(.top, 16)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            switch selectedCategory {
                            case .club:
                                ForEach(1...3, id: \.self) { _ in
                                    ArchiveCard(archive: club)
                                }
                                
                            case .narsha:
                                ForEach(1...3, id: \.self) { _ in
                                    ArchiveCard(archive: narsha)
                                }
                                
                            case .award:
                                ForEach(1...3, id: \.self) { _ in
                                    ArchiveCard(archive: award)
                                }
                                
                            case .project:
                                ForEach(1...3, id: \.self) { _ in
                                    ArchiveCard(archive: project)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                ZStack {
                    Color.main
                        .frame(width: 52, height: 52)
                        .cornerRadius(50)
                    Button("+") {
                        goToAdd = true
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                    .bold()
                }
                .shadow(radius: 5)
                .padding(.trailing, 16)
                .padding(.bottom, 36)
                
                NavigationLink(destination: PostView(endpoint: "share/post"), isActive: $goToAdd) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ArchiveView()
}
