//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessRCUV: View {
    
    @EnvironmentObject var BCoatUPCA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCB : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCC : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCColorant : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCD : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var upc : ChipOptions
        
    let thickness = ["30 mils", "50 mils", "1/16\""]
    
    var body: some View {
        VStack {
            HStack {
                Text("System Thickness")
                    .fontWeight(.heavy)
                Spacer()
                ChipRCUVInfo()
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
                    BCoatUPCA.covRate = 190
                    BCoatUPCB.covRate = 190
                    BCoatUPCC.covRate = 190
                    BCoatUPCD.covRate = 190
                    BCoatUPCColorant.covRate = 190
                    
                }
                if upc.ThicknessSelection == 1 {
                    BCoatUPCA.covRate = 120
                    BCoatUPCB.covRate = 120
                    BCoatUPCC.covRate = 120
                    BCoatUPCD.covRate = 120
                    BCoatUPCColorant.covRate = 120
                }
                if upc.ThicknessSelection == 2 {
                    BCoatUPCA.covRate = 80
                    BCoatUPCB.covRate = 80
                    BCoatUPCC.covRate = 80
                    BCoatUPCD.covRate = 80
                    BCoatUPCColorant.covRate = 80

                   
                }
            }
        }
    }
}


struct Thickness_PreviewsRCUV: PreviewProvider {
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
