//
//  SettingsView.swift
//  stonksProfitCalculator
//
//  Created by Nigel Gee on 20/03/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingAlert = false

    var BTCAdress: String = "1HuiBQEFGLCBgtKsfWjZG2as3NdkVKdeBA"
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()

            VStack {
                // About
                Text("About:")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)

                Text("Sell price included maker/taker fee \(0.001, format: .percent)")
                    .foregroundColor(.black)
                    .frame(width: 350, height: 60, alignment: .center)
                    .padding(30)

                Text("This is app for my crypto-blog in Telegram. Stay tuned for new features!")
                    .lineSpacing(10)
                    .foregroundColor(.black)
                    .frame(width: 350, height: 60, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)

                // Telegram redirect
                Link(destination: URL(string: "https://t.me/stonks_signals")!, label: {
                    HStack {
                        Text("Telegram:")
                            .foregroundColor(.black)
                        Image(systemName: "paperplane")
                    }
                })
                .frame(width: 120.0, height: 30.0)
                .background(.gray)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.bottom, 30)

                // Donate clipboard with alert
                Text("Feel free for donate (BTC):")
                    .foregroundColor(.black)
                    .padding(.bottom)

                Button {
                    UIPasteboard.general.string = BTCAdress
                    showingAlert = true
                } label: {
                    HStack {
                        Text(BTCAdress)
                        Image(systemName: "doc.on.clipboard")
                    }
                }
                .frame(width: 370.0, height: 40.0)
                .background(.gray)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.bottom, 30)
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Copied!"),
                    message: Text("Thank You!"),
                    dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
