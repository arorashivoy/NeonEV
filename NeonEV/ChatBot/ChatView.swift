//
//  ChatView.swift
//  NeonEV
//
//  Created by Shivoy Arora on 04/02/23.
//

import SwiftUI

struct msg{
    var msg: String = ""
    var who: Bool = false
    var id: UUID = UUID()
}

struct ChatView: View {
    @State private var message: msg = msg()
    @State private var msgText: String = ""
    @State private var messages: [msg] = [
        msg(msg: "start", who: true),
        msg(msg: """
!!!'Welcome to NeonEV'!!!
!!!नियॉनईवी में आपका स्वागत है!!!
""", who: false)
        
    ]
    @State private var chance = 0;
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack {
            // Background
            Color(red: 21/255, green: 39/255, blue: 49/255)
                .ignoresSafeArea()
            
            VStack {
                // Top bar
                HStack{
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Text("NeonEV")
                        .foregroundColor(.cyan)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding([.trailing, .leading, .top])
                
                Form{
                    
                    List(messages, id: \.self.id) { message in
                        ChatRow(message: message.msg, isMe: message.who)
                            .onAppear{
                                chance += 1
                            }
                        
                    }
                    .listRowBackground(Color(red: 21/255, green: 39/255, blue: 49/255))
                    .background(Color(red: 21/255, green: 39/255, blue: 49/255).ignoresSafeArea())
                }
                .scrollContentBackground(.hidden)
                
                
                
                HStack {
                    TextField("Enter your message", text: $msgText)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    // Button actions
                    Button(action: {
                        self.message.msg = msgText
                        self.message.who = true
                        //                        self.message.id = UUID()
                        
                        self.messages.append(self.message)
                        self.message = msg()
                        
                        if (msgText.lowercased() == "start") {
                            self.message.msg = """
!!!'Welcome to NeonEV'!!!
!!!नियॉनईवी में आपका स्वागत है!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                            
                        }
                        else if (msgText.lowercased() == "help") {
                            self.message.msg = """
start ->    Welcome to NeonEV
            !!!नियॉनईवी में आपका स्वागत है!!!
help ->     This Particular message
            !!!यह विशेष संदेश!!!
switch ->   Switch on/off your EV
            !!!अपने ईवी को चालू/बंद करें!!!
status ->   Battery Status
            !!!बैटरी की स्थिति!!!
range ->    Range left
            !!!रेंज बाकी है!!!
health ->   Battery Health
            !!!बैटरी स्वास्थ्य!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                        }
                        
                        else if (msgText.lowercased() == "switch") {
                            self.message.msg = """
EV is on
!!!ईवी चालू है!!!
"""
                            
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                        }
                        
                        else if (msgText.lowercased() == "status") {
                            self.message.msg = """
Battery Capacity 62%
!!!बैटरी क्षमता 62%!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                        }
                        else if (msgText.lowercased() == "range") {
                            self.message.msg = """
Range left 80km
!!!80 किमी की रेंज बाकी है!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                        }
                        
                        else if (msgText.lowercased() == "health") {
                            self.message.msg = """
Battery Needs Replacement
!!!बैटरी बदलने की जरूरत है!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                        }
                        else {
                            self.message.msg = """
Please choose correct option
!!!कृपया सही विकल्प चुनें!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                            
                            self.message.msg = """
start ->    Welcome to NeonEV
            !!!नियॉनईवी में आपका स्वागत है!!!
help ->     This Particular message
            !!!यह विशेष संदेश!!!
switch ->   Switch on/off your EV
            !!!अपने ईवी को चालू/बंद करें!!!
status ->   Battery Status
            !!!बैटरी की स्थिति!!!
range ->    Range left
            !!!रेंज बाकी है!!!
health ->   Battery Health
            !!!बैटरी स्वास्थ्य!!!
"""
                            self.message.who = false
                            self.messages.append(self.message)
                            self.message = msg()
                        }
                        
                        self.msgText = ""
                        
                    }) {
                        Text("Send")
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
