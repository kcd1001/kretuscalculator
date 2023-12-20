//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ESDEpoxySubSys: View {
    var body: some View {
        List{
            // Epoxy
            NavigationLink(destination: ESDTSView()){
                Text("ESD Conductive TS")
            }
            
            NavigationLink(destination: ESDTSDissView()){
                Text("ESD Dissipative TS")
            }


            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("ESD Sub-Systems")
    }
}

struct ESDEpoxySubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
