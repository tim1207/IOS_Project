//
//  Chart.swift
//  Lab09
//
//  Created by 林峻霆 on 2022/5/25.
//


import SwiftUI

struct Chart: View {
    @ObservedObject var iphoneData = UserData()
    @State private var selectedChart = "圓餅圖"
    var chart = ["圓餅圖", "柱狀圖"] // donut chart
    var Smoothnessnumber = [1, 2, 3, 4, 5]
    var UserCount: [Double] = [0,0,0,0,0]

    init (iphoneData: UserData){
        for user in iphoneData.users{
            for i in 0..<5{
                if user.Smoothness == Smoothnessnumber[i]{
                    UserCount[i] += 1
                }
            }
        }
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color.init(hue: 0.12, saturation: 0.3, brightness: 1)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Text("順暢度表現")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                Picker("圖表", selection: $selectedChart) {
                    ForEach(self.chart, id: \.self) { (Chart) in
                        Text(Chart)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                legend()
                if self.selectedChart == "圓餅圖" {
                    PieChartView(percentages: UserCount)
                    .frame(width: 400, height: 300)
                }
                else if self.selectedChart == "柱狀圖" {
                    HistogramView(typeWidths: UserCount)
                    .frame(width: 400, height: 300)
                }
            }
        }
    }
}
struct legend: View {
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                Text("一分順暢度")
                Circle()
                    .fill(Color.orange)
                    .frame(width: 20, height: 20)
                Text("兩分順暢度")
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 20, height: 20)
                Text("三分順暢度")
            }
            HStack{
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                Text("四分順暢度")
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                Text("五分順暢度")
            }
        }
    }
    
}
struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart(iphoneData: UserData())
    }
}
