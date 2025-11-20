import SwiftUI

class ProfileViewModel : ObservableObject {
    @Published var Info : ProflieModel = ProflieModel(username: "it is id", phone: "010-1111-1111", email: "yaho@gamil.ocm", grade: 1, class_no: 2, student_no: 3, club: .BIND)
}
