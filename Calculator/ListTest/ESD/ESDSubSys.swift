//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ESDSubSys: View {
    var body: some View {
        List{
            // Epoxy
            NavigationLink(destination: ESDEpoxySubSys()){
                Text("ESD Epoxy")
            }
            
            // UPC
//            NavigationLink(destination: ESDUPCSubSys()){
//                Text("ESD UPC")
//            }

            


            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("ESD Sub-Systems")
    }
}

struct ESDSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
