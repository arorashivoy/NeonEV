//
//  ChatRow.swift
//  NeonEV
//
//  Created by Shivoy Arora on 04/02/23.
//

import SwiftUI

struct ChatRow: View {
    var message: String
    var isMe: Bool
    
    var body: some View {
        ZStack {
            // Background
            Color(red: 21/255, green: 39/255, blue: 49/255)
                .ignoresSafeArea()
            
            HStack {
                if isMe {
                    Spacer()
                    Text(message)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                } else {
                    Text(message)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Spacer()
                }
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: "hi", isMe: true)
    }
}
