//
//  PieChart.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//


import SwiftUI

struct PieChartView: View {
    var percentages:[Double]?
    var angles: [Angle]
    
    init(percentages: [Double]){
        var sum: Double = 0
        var finalpercentage: [Double] = [0,0,0,0,0]
        for i in 0..<5 {
         sum = sum + percentages[i]
        }
        
        for j in 0..<5 {
            finalpercentage[j] = percentages[j] / sum
        }
        
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in finalpercentage {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage
        }
    }
    
    var body: some View {
        ZStack() {
            PieChart(startAngle: self.angles[0], endAngle: self.angles[1])
                .fill(Color.red)
            PieChart(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.orange)
            PieChart(startAngle: self.angles[2], endAngle: self.angles[3])
                .fill(Color.yellow)
            PieChart(startAngle: self.angles[3], endAngle: self.angles[4])
                .fill(Color.green)
            PieChart(startAngle: self.angles[4], endAngle: self.angles[0])
                .fill(Color.blue)
        }.frame(width: 300, height: 300)
    }
}

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) ->Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [5, 10, 15, 20, 25])
//        PieChart(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90))
    }
}
