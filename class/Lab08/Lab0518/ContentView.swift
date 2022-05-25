//
//  ContentView.swift
//  Lab0518
//
//  Created by 林峻霆 on 2022/5/18.
//

import SwiftUI

struct ContentView: View {
    @State private var something = ""
    @State private var isfan = false
    @State private var alertShow = false
    @State private var birthday = Date()
    @State private var age = 0
   
    @State private var scale: Double = 1
    let songs = ["Love more", "告白氣球", "說好不哭"]
    @State private var selectedIndex = 0
    var body: some View {
        VStack{
            
            Image("pic")
                .resizable()
                .frame(width: 200, height:200)
                .clipShape(Circle())
                .shadow(radius: 10)
            List{
                Text("林峻霆")
                    .frame(maxWidth: .infinity, alignment: .center)
                Toggle("你是粉絲嗎？", isOn: $isfan)
                    .padding(-8.0)
                DatePicker("生日", selection: $birthday, displayedComponents: .date)
                    .padding(-8.0)
                Stepper("年齡:\(age)", value: $age)
                    .padding(-8.0)
                
                HStack{
                    Text("喜歡程度: \(Int(scale))")
                        .padding(-8.0)
                    Slider(value: $scale, in: 0...10, step: 1)
                        .padding(8.0)
                        .tint(.orange)
                }
                Picker("Please choose a song",selection: $selectedIndex) {
                    Text(songs[0]).tag(0)
                    Text(songs[1]).tag(1)
                    Text(songs[2]).tag(2)
                }
                .pickerStyle(.segmented)
                
                TextField("Say somthing", text: $something)
                    .textFieldStyle(.roundedBorder)
                    .padding(-8.0)
                
                Button("確認"){
                    alertShow = true
                }
                .buttonStyle(.bordered)
                .frame(maxWidth: .infinity, alignment: .center)
                .alert(isPresented:$alertShow){
                    Alert(title: Text("資料"),
                          message:Text(" 你是粉絲:\(isfan ?"是":"不是")\n年紀:\(age)\n生日:\(birthday,format: .dateTime.day().month().year())\n喜歡程度:\(Int(scale))\n喜歡的歌：\(songs[selectedIndex])\n你說的話：\(something)"))
                    
                }
                
                
            }
            
        }
        .background(
        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom))
    }
        
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
