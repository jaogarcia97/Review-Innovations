//
//  SeatSelectionView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/30/24.
//

import SwiftUI

struct SeatSelectionView: View {
    @EnvironmentObject var model: Model
    @State private var isTabBarHidden = true
    @State private var animateGradient: Bool = false
    @ObservedObject var viewModel = SeatSelectionViewModel(numberOfSeats: 120)
    
    let columns = [
        GridItem(.fixed(20)),
        GridItem(.fixed(20)),
        GridItem(.fixed(20)),
        GridItem(.fixed(20)),
        GridItem(.fixed(20)),
        GridItem(.fixed(20))
    ]
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                VStack {
                    Spacer().frame(height: 20)
                    
                    HStack{
                        Text("Available Sections")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                    
                    HStack(){
                        CustomButton(label: "MWF") {
                            // Action for MWF button
                        }
                        CustomButton(label: "TThS") {
                            // Action for TThS button
                        }
                        CustomButton(label: "WKND") {
                            // Action for WKND button
                        }
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    HStack(){
                        CustomButton(label: "MNL") {
                            // Action for MWF button
                        }
                        CustomButton(label: "BGUIO") {
                            // Action for TThS button
                        }
                        CustomButton(label: "CEB") {
                            // Action for WKND button
                        }
                        CustomButton(label: "DVAO") {
                            // Action for WKND button
                        }
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    Spacer().frame(height: 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(model.classes) { schedule in
                                Button {
                                    // Action for schedule
                                } label: {
                                    SectionScheduleCell(schedule: schedule)
                                }
                            }
                        }
                    }
                    .task {
                        do {
                            model.loadSchedules()
                        }
                    }
                    .padding(.leading, 10)
                    
                    
                    Spacer().frame(height: 20)
                    
                    Rectangle()
                        .frame(height: 2)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .shadow(color: .yellow, radius: 1, x: 0, y: 0)
                    
                    
                    Spacer().frame(height: 20)
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .cornerRadius(8)
                            .padding(.horizontal, 50)
                            .shadow(color: .yellow, radius: 6, x: 0, y: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 1)
                                    .blur(radius: 20)
                                    .offset(x: 0, y: 0)
                            )
                        
                        Text("RI PODIUM")
                            .bold()
                            .foregroundColor(.gray)
                    }
                    
                    
                    Spacer().frame(height: 30)
                    
                    
                    HStack(alignment: .top){
                        // Left side seats
                        LazyVGrid(columns: columns, spacing: 4) {
                            ForEach(0..<(viewModel.seats.count / 2), id: \.self) { index in
                                SeatView(isSelected: viewModel.seats[index].isSelected)
                                    .onTapGesture {
                                        viewModel.toggleSeatSelection(at: index)
                                    }
                            }
                        }
                        
                        // Spacer for the aisle
                        Spacer().frame(width: 20)
                        
                        // Right side seats
                        LazyVGrid(columns: columns, spacing: 4) {
                            ForEach((viewModel.seats.count / 2)..<viewModel.seats.count, id: \.self) { index in
                                SeatView(isSelected: viewModel.seats[index].isSelected)
                                    .onTapGesture {
                                        viewModel.toggleSeatSelection(at: index)
                                    }
                            }
                        }
                    }
                }
                
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(height: 55)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                        .foregroundColor(.blue)
                    
                    Text("Assign Seat")
                        .foregroundColor(.white)
                        .bold()
                }
                
            }
            .padding(.bottom, 0)
            
        }
        .background(SeatSelectionBackground())
        //.navigationBarBackButtonHidden(true)
        .tabBar(hidden: isTabBarHidden)
        
        
        
    }
}

struct SeatView: View {
    let isSelected: Bool
    
    var body: some View {
        Rectangle()
            .fill(isSelected ? Color.yellow : Color.gray)
            .frame(width: 20, height: 20)
            .cornerRadius(2)
            .padding(2)
            .shadow(radius: 20)
        
    }
}

class SeatSelectionViewModel: ObservableObject {
    @Published var seats: [Seat]
    
    init(numberOfSeats: Int) {
        self.seats = Array(repeating: Seat(), count: numberOfSeats)
    }
    
    func toggleSeatSelection(at index: Int) {
        seats[index].isSelected.toggle()
    }
}

struct Seat: Identifiable {
    let id = UUID()
    var isSelected: Bool = false
}


extension View {
    func tabBar(hidden: Bool) -> some View {
        background(TabBarAccessor { tabBar in
            tabBar?.isHidden = hidden
        })
    }
}

struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar?) -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        DispatchQueue.main.async {
            self.callback(viewController.tabBarController?.tabBar)
        }
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}


struct CustomButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .cornerRadius(5)
                    .frame(width: 70, height: 25)
                    .foregroundColor(.white)
                    .shadow(color: .yellow, radius: 1, x: 0, y: 0)
                Text(label)
                    .foregroundColor(.black)
                    .bold()
            }
        }
    }
}


#Preview {
    SeatSelectionView()
        .environmentObject(Model())
}
