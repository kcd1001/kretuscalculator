//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessSL: View {
    
@EnvironmentObject var UPCASL : stats
@EnvironmentObject var UPCBSL : stats
@EnvironmentObject var UPCCSL : stats
@EnvironmentObject var color : Colorant
@EnvironmentObject var upc : options
        
let thickness = ["1/8\"", "3/16\"", "1/4\""]
    

    

    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness")
                    .fontWeight(.heavy)
                Spacer()
                UPCSLInfo()
            }.padding()
            Picker(selection: $upc.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: upc.ThicknessSelection) { _ in
                if upc.ThicknessSelection == 0 {
                    UPCASL.covRate = 50
                    UPCBSL.covRate = 50
                    UPCBSL.covRate = 50
                    
                }
                if upc.ThicknessSelection == 1 {
                    UPCASL.covRate = 35
                    UPCBSL.covRate = 35
                    UPCBSL.covRate = 35
                    
                }
                if upc.ThicknessSelection == 2 {
                    UPCASL.covRate = 25
                    UPCBSL.covRate = 25
                    UPCBSL.covRate = 25
                   
                }
            }
        }
    }
}


struct Thickness_PreviewsSL: PreviewProvider {
    static let test1 = stats(product: "Urethane Polymer Concrete Part A:", covRate: 200, MixRat: 6)
    static let test2 = stats(product: "Urethane Polymer Concrete Part B:", covRate: 200, MixRat: 6)
    static let test3 = stats(product: "Urethane Polymer Concrete Part C:", covRate: 200, MixRat: 6)
    static var previews: some View {
        Thickness()
            .environmentObject(test1)
            .environmentObject(test2)
            .environmentObject(test3)
    }
}
