//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine


struct ThicknessTT: View {
    
@EnvironmentObject var UPCATT : stats
@EnvironmentObject var UPCBTT : stats
@EnvironmentObject var UPCCTT : stats
@EnvironmentObject var color : Colorant
@EnvironmentObject var upc : options
        
let thickness = ["1/4\"", "3/8\"", "3/4\""]

    

    var body: some View {
      
        VStack {
            HStack {
                Text("Coating Thickness")
                    .fontWeight(.heavy)
                Spacer()
                UPCTTInfo()
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
                    UPCATT.covRate = 24
                    UPCBTT.covRate = 24
                    UPCBTT.covRate = 24
                    
                }
                if upc.ThicknessSelection == 1 {
                    UPCATT.covRate = 14
                    UPCBTT.covRate = 14
                    UPCBTT.covRate = 14
                    
                }
                if upc.ThicknessSelection == 2 {
                    UPCATT.covRate = 10
                    UPCBTT.covRate = 10
                    UPCBTT.covRate = 10
                   
                }
            }
            }
        }
    }



struct ThicknessTT_Previews: PreviewProvider {
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
