//
//  SeatSelectionView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/30/24.
//

import SwiftUI

struct SeatSelectionView: View {
    @State private var animateGradient: Bool = false
    @ObservedObject var viewModel = SeatSelectionViewModel(numberOfSeats: 50)
    
    let columns = [
        GridItem(.adaptive(minimum: 30))
    ]
    var body: some View {
        VStack {
            Text("Select your seat")
                .font(.largeTitle)
                .padding()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.seats.indices, id: \.self) { index in
                    SeatView(isSelected: viewModel.seats[index].isSelected)
                        .onTapGesture {
                            viewModel.toggleSeatSelection(at: index)
                        }
                }
            }
            .padding()
        }
    }
}

struct SeatView: View {
    let isSelected: Bool
    
    var body: some View {
        Circle()
            .fill(isSelected ? Color.green : Color.gray)
            .frame(width: 30, height: 30)
            .padding(5)
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

#Preview {
    SeatSelectionView()
}
