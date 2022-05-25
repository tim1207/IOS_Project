//
//  ContentView.swift
//  App0504
//
//  Created by 林峻霆 on 2022/5/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(systemName: "person.2.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .foregroundColor(.blue)
            Text("Health Sharing")
                .font(.system(size: 40))
                .bold()
            HStack{
                Image(systemName: "checklist")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 75)
                    .foregroundColor(.blue)
                    .padding(15)
                VStack{
                    Text("You are in control")
                        .bold()
                        .frame(width: 300, height: 30, alignment: .topLeading)
                    Text("Keep frind and family up to date on how you're doing by securely sgareing you're Health data.")
                }
            }
            .frame(width: 400, height: 150)
            .padding(10)
            HStack{
                Image(systemName: "bell.badge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 75)
                    .foregroundColor(.blue)
                    .padding(15)
                VStack{
                    Text("Dashboard and Notification")
                        .bold()
                        .frame(width: 300, height: 30, alignment: .topLeading)
                    Text("Data you share will appear in their Health app. They can also get notifications if there's an update.")
                }
            }
            .frame(width: 400, height: 150)
            .padding(10)
            HStack{
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 75)
                    .foregroundColor(.blue)
                    .padding(15)
                VStack{
                    Text("Private and Secure")
                        .bold()
                        .frame(width: 300, height: 30, alignment: .topLeading)
                    Text("Only a summary of each topic is shared, not the detials.The information is encrypted and you can stop sharing at any time.")
                }
            }
            .frame(width: 400, height: 150)
            .padding(10)
            Button("Share with Someone"){
                
            }.foregroundColor(.white)
            
                .frame(width: 300, height: 50, alignment: Alignment.center)
                .background(.blue)
                .frame(width: nil)
                .cornerRadius(30)
            
            
        }
        VStack{
            Image("photo")
                .resizable()
                .frame(width: 400, height: 200, alignment: .center)
            HStack{
                Image(systemName: "applelogo")
                Text("News +")
                    .bold()
            }
            Text("Great News!")
                .font(.system(size: 30))
            Text("Audio stories on here")
                .font(.system(size: 30))
                .foregroundColor(.pink)
            Text("Listen only in Apple News+.")
                .font(.system(size: 30))
            Button("Get Started"){
                
            }.foregroundColor(.white)
            
                .frame(width: 300, height: 50, alignment: Alignment.center)
                .background(.pink)
                .frame(width: nil)
                .cornerRadius(30)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
