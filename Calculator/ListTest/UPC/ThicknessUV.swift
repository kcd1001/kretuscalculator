//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine



struct ThicknessUV: View {
    
@EnvironmentObject var UPCA : stats
@EnvironmentObject var UPCB : stats
@EnvironmentObject var UPCC : stats
@EnvironmentObject var color : Colorant
@EnvironmentObject var upc : options
        
let thickness = [ "8-12 mils","15-20 mils", "25-30 mils"]
    
func getThickness() -> Void {
    if upc.ThicknessSelection == 0 {
        upc.totalThickness = 12
    }
    else if upc.ThicknessSelection == 1 {
        upc.totalThickness = 20
    }
    else if upc.ThicknessSelection == 2 {
        upc.totalThickness = 30
    }
    if upc.isPrimeCoat == true {
            upc.totalThickness += 7
        }
    if upc.isTopCoat == true {
            upc.totalThickness += 12
        }
    if color.selection == 3 || color.selection == 8 {
        upc.ThicknessSelection = 3
    }
}
    

    var body: some View {
      
        VStack {
            HStack {
                Text("Coating Thickness")
                    .fontWeight(.heavy)
                Spacer()
                UPCUVInfo()
            }.padding()
            Picker(selection: $upc.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onAppear(perform: getThickness)
            .onChange(of: upc.ThicknessSelection) { _ in
                getThickness()

                if upc.ThicknessSelection == 0 {
                    UPCA.covRate = 190
                    UPCB.covRate = 190
                    UPCB.covRate = 190
                    
                }
                if upc.ThicknessSelection == 1 {
                    UPCA.covRate = 120
                    UPCB.covRate = 120
                    UPCB.covRate = 120
                   
                }
                if upc.ThicknessSelection == 2 {
                    UPCA.covRate = 80
                    UPCB.covRate = 80
                    UPCB.covRate = 80
                
                }
            }
            .onChange(of: color.selection) { _ in
                if color.selection == 3 || color.selection == 8 {
                    upc.ThicknessSelection = 3
                }
            }
        }
    }
}


struct ThicknessUV_Previews: PreviewProvider {
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
