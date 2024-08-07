//
//  EnterStudentKeyView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 8/3/24.
//

import SwiftUI

struct EnterStudentKeyView: View {
    @State private var studentKey: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    @State private var navigateToConfirmation = false

    var body: some View {
        VStack(alignment: .leading){
            Text("Enter Student Key")
                .font(.title)
                .bold()
                .padding(.horizontal, 20)

            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $studentKey[index])
                        .frame(width: 50, height:50)
                        .multilineTextAlignment(.center)
                        .keyboardType(index < 3 ? .default : .numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .focused($focusedField, equals: index)
                        .onChange(of: studentKey[index]) { newValue in
                            if index < 3 {
                                // Allow only letters for the first three fields
                                let filtered = newValue.filter { $0.isLetter }
                                if filtered != newValue {
                                    studentKey[index] = filtered
                                }
                            } else {
                                // Allow only numbers for the last three fields
                                let filtered = newValue.filter { $0.isNumber }
                                if filtered != newValue {
                                    studentKey[index] = filtered
                                }
                            }
                            
                            if studentKey[index].count == 1 && index < 5 {
                                focusedField = index + 1
                            } else if studentKey[index].isEmpty && index > 0 {
                                focusedField = index - 1
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
            
            Text("You can get the student key from the registrar's office")
                .padding(.horizontal, 20)

            
            NavigationLink(destination: SeatConfirmationView(), isActive: $navigateToConfirmation) {
                Button() {
                    // Handle the submission of the student key
                    let key = studentKey.joined()
                    print("Student Key: \(key)")
                    navigateToConfirmation = true
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 50)
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                        Text("Submit")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            
        }
        .onAppear {
            focusedField = 0
        }
    }
}

#Preview {
    EnterStudentKeyView()
}
