//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessUPCCove: View {
    
    @EnvironmentObject var CoveColor : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var bCoatCoveUPCA : stats2
    @EnvironmentObject var bCoatCoveUPCB : stats2
    @EnvironmentObject var bCoatCoveUPCColorant : stats2
    @EnvironmentObject var bCoatCoveTexture : stats2
    
    let thickness = ["4\"", "6 \""]
    
    var body: some View {
        VStack {
            HStack {
                Text("System Thickness")
                    .fontWeight(.heavy)
                Spacer()
 //               ChipRCInfo()
            }.padding()
            Picker(selection: $CoveColor.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: CoveColor.ThicknessSelection) { _ in
                if CoveColor.ThicknessSelection == 0 {
                    bCoatCoveUPCA.covRate = 30
                    bCoatCoveUPCB.covRate = 30
                    bCoatCoveUPCColorant.covRate = 30
                    
                }
                if CoveColor.ThicknessSelection == 1 {
                    bCoatCoveUPCA.covRate = 20
                    bCoatCoveUPCB.covRate = 20
                    bCoatCoveUPCColorant.covRate = 20
                }
            }
        }
    }
}


struct ThicknessUPCCove_Previews: PreviewProvider {
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
