//
//  UPCRC2.swift
//  ListTest
//
//  Created by Kane Davidson on 11/20/20.
//

import SwiftUI

struct UPCSysInfo: View {
    @State var showingPopup = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button(action: {
                    self.showingPopup = true
                }, label: {
                    Text("?")
                        .underline()
                })
            }
            if $showingPopup.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                            Text("UPC RC (Urethane Polymer Concrete RC)")
                                .fontWeight(.heavy)
                        Spacer()
                        HStack {
                            Text("UPC RC / EZ")
                            VStack {
                                Text("-Easy to apply. Great for beginners")
                                    .font(.caption)
                                    .offset(x: 8)
                                Text("-Use in high temps, low to high humidity.")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            Text("UPC RC / AP")
                            Spacer()
                            VStack {
                                Text("-For mid-level to experienced installers. ")
                                    .font(.caption)
                                    .offset(x: -12)
                                Text("-Use in high temps, low to high humidity.")
                                    .font(.caption)
                                    .offset(x: -9)
                            }
                        }
                        HStack {
                            Text("UPC RC / FC")
                            Spacer()
                            VStack {
                                Text("-For experienced installers.")
                                    .font(.caption)
                                    .offset(x:-20)
                                Text("-Use in low temps, low humidity.")
                                    .font(.caption)
                                    .offset(x:-6)
                            }
                        }
                    Spacer()
                        HStack{
                            List {
                                Section(header: Text("UPC RC            /EZ           /AP         /FC")){
                                    Text("Recom. App. Temp  60-90°F <80% RH    40-80°F  <70% RH  40-80°F <45% RH")
                                        
                                }
                            }
                        }
        
                        Button(action: {
                            self.showingPopup = false
                        }, label: {
                            Text("Close")
                        })
                    }.padding() .ignoresSafeArea()
                }
                .frame(width: 350, height: 500, alignment: .center)
                .cornerRadius(20).shadow(radius: 20)
}
}
    }
}
struct UPCSysInfo_Previews: PreviewProvider {
    static var previews: some View {
        UPCSysInfo()
    }
}
