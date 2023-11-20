////
////  DatePickerView.swift
////  Quiz Code
////
////  Created by nic on 2023-10-05.
////
//
//import SwiftUI
//
//struct DatePickerView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var birthday: Date = Date()
//    @EnvironmentObject var viewModel: UserViewModel
//    var body: some View {
//           VStack{
//               NavigationStack{
//                   Form{
//                       DatePicker("Enter your birthday: ", selection: $birthday, displayedComponents: .date)
//                           .datePickerStyle(WheelDatePickerStyle())
//                           .frame( maxHeight: 200)
//                   .toolbar {
//                       ToolbarItemGroup(placement: .confirmationAction){
//                           Button(action: {dismiss()}, label: {
//                               Text("Done")
//                           })
//                       }
//                   }
//               }
//           }.presentationDetents([.medium])
//           }.onChange(of: birthday) {
//               viewModel.user.birthday = birthday
//           }
//   }
//}
//
//#Preview{
//    DatePickerView()
//}
