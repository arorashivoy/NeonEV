//
//  BatterHealth.swift
//  NeonEV
//
//  Created by Shivoy Arora on 04/02/23.
//

import SwiftUI

struct BatteryHealth: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image("healthScreen")
                .resizable()
                .ignoresSafeArea()
            
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
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct BatterHealth_Previews: PreviewProvider {
    static var previews: some View {
        BatteryHealth()
    }
}
