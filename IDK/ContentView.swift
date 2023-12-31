//
//  ContentView.swift
//  IDK
//
//  Created by mac on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showCards : Bool = false
    var arrayOfNames: [String] = ["Hamza Al Jabr","Mohammad Al Diri","Abbas Al fahman","Mike Tyson","Laura Hein","Sean Allen","Martin Haardt"]
    
    
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.4)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                if !showCards {
                    ZStack{
                       
                        BankCard(Inhaber: "Hamza Al Jabr", filiale: "Ilmenau")
                        
                        BankCard(Inhaber: "Hamza Al Jabr", filiale: "Ilmenau")
                            .offset(x: 3, y: 5)
                        BankCard(Inhaber: "Hamza Al Jabr", filiale: "Ilmenau")
                            .offset(x: 6, y: 10)
                        BankCard(Inhaber: "Hamza Al Jabr", filiale: "Ilmenau")
                            .offset(x: 9, y: 14)
                    }
                    .onTapGesture{
                        showCards.toggle()
                    }
                }
                
                else{
                    VStack{
                        ForEach(arrayOfNames.indices){
                            BankCard(Inhaber: arrayOfNames[$0] ,filiale: "Ilmenau")
                            
                            
                        }
                        
                        
                    }
                }
                
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct BankCard : View{
    var Inhaber: String = "Hamzeh Al Jabr"
    var filiale : String = "Ilmenau"
    
    var body: some View{
        
        ZStack(){
            LinearGradient(colors:
                            [.black.opacity(0.1), .black.opacity(0.2)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            
            VStack (alignment: .leading , spacing: 0){
                
                HStack {
                    Image("Sparkasse")
                    Text("Sparkasse\n \(filiale)")
                        .fontWeight(.regular)
                        .foregroundColor(.black.opacity(0.6))
                        .font(.system(size: 18))
                        .bold()
                        .frame(alignment: .topLeading)
                }
                Text("\(Inhaber)")
                //.font(.system(size: 23))
                    .font(.title2)
                    .fontWeight(.thin)
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.horizontal)
                
                HStack(){
                    
                    Image("sk")
                        .resizable()
                        .frame(width: 65, height: 45)
                        .clipShape(Capsule())
                        .padding(.leading)
                    Image(systemName: "dot.radiowaves.right")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    HStack{
                        if #available(iOS 15.0, *) {
                            Circle()
                                .foregroundColor(.red)
                                .overlay {
                                    Circle()
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(.white)
                                }
                        } else {
                            // Fallback on earlier versions
                        }
                        //  if #available(iOS 15.0, *) {
                        Circle()
                            .foregroundColor(.orange)
                            .offset(x: -33)
                       
                    }.padding(.trailing)
                        .offset(x:60)
                    Image("giro")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .padding(.horizontal)
                }
                .frame(width: .infinity, height: 55)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                HStack () {
                    VStack(alignment: .leading){
                        Text("IBAN")
                            .font(.system(size: 12))
                            .fontWeight(.thin)
                            .foregroundColor(.blue.opacity(0.6))
                        Text("DE79 3472 6400 1000 3483 23")
                            .fontWeight(.thin)
                            .foregroundColor(.black.opacity(0.6))
                        //.padding(.leading)
                    }
                    // .frame(width: 300, height: 30,alignment: .leading)
                    
                    VStack{
                        Text("gültig bis")
                            .font(.system(size: 12))
                            .fontWeight(.thin)
                            .foregroundColor(.blue)
                        Text("12/25")
                            .font(.system(size: 14))
                            .fontWeight(.thin)
                            .foregroundColor(.black.opacity(0.6))
                        
                    }
                    
                }
                .frame(width: 365, height: 30)
                .background(Color.white)
                
                
            }
            
            
            
        }
        .padding()
        .frame(width: 360, height: 230)
        .background(Color.red)
        .cornerRadius(25)
        .shadow(radius: 2)
        .overlay(Rectangle()
                    .stroke(lineWidth: 0.5)
                    .cornerRadius(25))
        
        
    }
    
}
