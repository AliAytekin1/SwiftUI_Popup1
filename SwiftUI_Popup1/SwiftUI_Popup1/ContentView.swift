//
//  ContentView.swift
//  SwiftUI_Popup1
//
//  Created by Ali Aytekin on 9.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var gorunsunPopup = false
    @State private var username = ""
    @State private var password = ""
    @State private var girisBasarili : Bool = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack (spacing :20){
                Image("kiz_kulesi").resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.2, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.yellow, lineWidth: 4))
                    .shadow(radius: 10)
                HStack{
                    Text("Username :").padding()
                        .background(Color.black)
                        .cornerRadius(30)
                        .shadow(color: .white, radius: 10, x:3, y:1 )
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.orange)
                    TextField("", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                HStack{
                    Text("Password:").padding()
                        .background(Color.black)
                        .cornerRadius(35)
                        .shadow(color: .white, radius: 10, x:3, y:1 )
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.orange)
                    TextField("",text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                Button(action:  {
                    self.gorunsunPopup = true
                    if self.username == "Deneme" && self.password == "1234567890" {
                        self.girisBasarili = true
                    }else{
                        self.girisBasarili = false
                    }
                }, label: {
                    Text("login").padding(.all)
                        .background(Color.black)
                        .cornerRadius(35)
                        .shadow(color: .white, radius: 10, x:3, y:1 )
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.orange)
                }).padding()
            }.blur(radius: $gorunsunPopup.wrappedValue ? 3 : 0)
            
            
            if $gorunsunPopup.wrappedValue{
                
            
                    Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
                    VStack(spacing :20){
                        Text(self.girisBasarili ? "BAŞARILI": "HATA !!!").bold().padding().frame(maxWidth: .infinity).background(Color.orange).foregroundColor(.white)
                        Spacer()
                        Text(self.girisBasarili ? "Giriş Başarılı" : "Başarısız Giriş Denemesi").foregroundColor(self.girisBasarili ?.green : .red).bold()
                        Spacer()
                        Button(action: {self.gorunsunPopup = false}, label: {
                            Text("Kapat")
                        }).padding(.bottom,20)
                        
                
                }.frame(width: 300, height: 200)
                    .background(Color.white).cornerRadius(20).shadow(radius: 20)
            }
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}

