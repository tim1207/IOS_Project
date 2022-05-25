//
//  Histogram.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//


import SwiftUI

struct HistogramView: View {
    var typeWidths: [Double]

    var body: some View {
        HStack {
            Histogram(Width: typeWidths[0])
                .foregroundColor(.red)
            Histogram(Width: typeWidths[1])
                .foregroundColor(.orange)
            Histogram(Width: typeWidths[2])
                .foregroundColor(.yellow)
            Histogram(Width: typeWidths[3])
                .foregroundColor(.green)
            Histogram(Width: typeWidths[4])
                .foregroundColor(.blue)
        }
    }
}
struct Histogram: View {
    @State private var width: CGFloat = 0
    var Width: Double

    var body: some View{
        ZStack(alignment: .bottom) {
            Capsule()
            .frame(width: 40, height: 250)
            .foregroundColor(Color(hue: 0.155, saturation: 1.0, brightness: 1.0))
            VStack(spacing: 3) {
                Text("\(Int(self.Width))")
                    .foregroundColor(.black)
                Capsule()
                    .frame(width: 40, height: width * 20)
                    .foregroundColor(Color.orange)
                    .animation(.linear(duration: 1))
                    .onAppear{
                        self.width = CGFloat(self.Width)
                }
            }
        }
    }
}

struct Histogram_Previews: PreviewProvider {
    static var previews: some View {
//        HistogramView(typeWidths: [2, 10, 10, 10, 10])
        Histogram(Width: 3)
    }
}
