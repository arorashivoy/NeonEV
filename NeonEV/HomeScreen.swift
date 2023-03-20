//
//  HomeScreen.swift
//  NeonEV
//
//  Created by Shivoy Arora on 04/03/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var presentLocation = false
    @State private var presentHealth = false
    @State private var presentChat = false
    var body: some View {
        ZStack{
            
            // Background
            Color(red: 21/255, green: 39/255, blue: 49/255)
                .ignoresSafeArea()
            
            
            VStack{
                
                // Top bar
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Text("NeonEV")
                        .foregroundColor(.cyan)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding([.trailing, .leading, .top])
                
                Image("scooter")
                
                
                // Bottom section
                ZStack {
                    RoundedRectangle(cornerRadius: 45)
                        .foregroundColor(.cyan)
                        .ignoresSafeArea()
                    
                    VStack(){
                        HStack{
                            Image("temp")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Image("power")
                                .frame(maxWidth: .infinity, alignment: .center)
                            Button {
                                presentChat = true
                            }label: {
                                Image("msg")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .sheet(isPresented: $presentChat) {
                                ChatView()
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding([.leading, .trailing, .top])
                        
                        Text("Consider Parking your vehicle in shade")
                            .frame(maxHeight: .infinity, alignment: .top)
                        
                        HStack{
                            Button{
                                presentLocation = true
                            }label: {
                                Image("location")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .fullScreenCover(isPresented: $presentLocation, content: {
                                CurrMapView()
                            })
                            
                            Button{
                                presentHealth = true
                            }label: {
                                Image("health")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .sheet(isPresented: $presentHealth, content: {
                                BatteryHealth()
                            })
                        }
                        .padding()
                        
                    }
                        
                }
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            
    }
}
