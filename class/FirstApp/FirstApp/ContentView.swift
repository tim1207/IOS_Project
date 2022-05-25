//
//  ContentView.swift
//  FirstApp
//
//  Created by 林峻霆 on 2022/5/2.
//

import SwiftUI
// View is a protocol
struct ContentView: View {
    var body: some View {
        /*
        HStack(alignment: .bottom, spacing: 50) {
            VStack(alignment: .leading, spacing: 10){
                Text("他們說我是")
                Text("沒有用的")
                    .foregroundColor(Color.orange)
            }
            Text("年輕人")
                .foregroundColor(Color.orange)
        }
        VStack {
            Group{
                Text("他們說我是沒有用的")
                Text("年輕人")
            }
            
            .foregroundColor(Color.orange)
            Text("This is my first App")// 順序有影響
                .padding()
                .font(.title)
                .foregroundColor(.orange)
                .background(Color.blue)
                .cornerRadius(10.0)
                .rotation3DEffect(Angle(degrees: 30), axis: (x: 1, y: 1, z: 1))
                .shadow(radius: 20)
        }
        */
        
        VStack {
            Image("picture")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            //                .ignoresSafeArea()
            //                .scaledToFit() //讓圖片維持比例但左右或上下留白的 scaledToFit
            HStack {
                Text("Tim")
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text("外號: 王子")
                    Text("身高: 180")
                }
            }
        }
        /*
        VStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 300)
            Image(systemName: "magnifyingglass")
                .font(Font.system(size: 100,
                                  weight: .heavy))
                .foregroundColor(.blue)
        }
        
        
        ZStack{
            Image("grass")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:.infinity)
                .ignoresSafeArea()
            VStack{
                Text("對的人")
                HStack{
                    Text("Hi")
                    Text("Hello")
                }
            }
            .font(.largeTitle)
            
        }*/
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
