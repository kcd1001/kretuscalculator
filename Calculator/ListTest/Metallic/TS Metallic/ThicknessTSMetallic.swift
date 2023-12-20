//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessTSMetallic: View {
    
    @EnvironmentObject var tsMetallic : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var bCoatCoveTSA : stats2
    @EnvironmentObject var bCoatCoveTSB : stats2
    @EnvironmentObject var bCoatCovePigment : stats2
    
    let thickness = ["15-20 WFT", "25-30 WFT", "40-45 WFT"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Coat Thickness")
                    .fontWeight(.heavy)
                Spacer()
 //               ChipRCInfo()
            }.padding()
            Picker(selection: $tsMetallic.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: tsMetallic.ThicknessSelection) { _ in
                if tsMetallic.ThicknessSelection == 0 {
                    bCoatCoveTSA.covRate = 120
                    bCoatCoveTSB.covRate = 120
                    bCoatCovePigment.covRate = 120
                    
                }
                if tsMetallic.ThicknessSelection == 1 {
                    bCoatCoveTSA.covRate = 80
                    bCoatCoveTSB.covRate = 80
                    bCoatCovePigment.covRate = 80
                }
                if tsMetallic.ThicknessSelection == 2 {
                    bCoatCoveTSA.covRate = 36
                    bCoatCoveTSB.covRate = 36
                    bCoatCovePigment.covRate = 36
                }
            }
        }
    }
}


struct ThicknessTSMetallic_Previews: PreviewProvider {
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
