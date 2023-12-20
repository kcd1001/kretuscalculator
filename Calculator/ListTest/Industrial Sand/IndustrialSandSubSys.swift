//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct IndustrialSandSubSys: View {
    var body: some View {
        List{
            // Epoxy
            NavigationLink(destination: IndustrialSandEpoxySubSys()){
                Text("Industrial Sand Epoxy")
            }
            
            // UPC
            NavigationLink(destination: IndustrialSandUPCSubSys()){
                Text("Industrial Sand UPC")
            }

            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Industrial Sub-Systems")
    }
}

struct IndustrialSandSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
