//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ESDUPCSubSys: View {
    var body: some View {
        List{
            
            // UPC
            NavigationLink(destination: ESDRCView()){
                Text("ESD Conductive RC")
            }
            NavigationLink(destination: ESDDisRCView()){
                Text("ESD Dissipative RC")
            }
            
            NavigationLink(destination: ESDSLView()){
                Text("ESD Conductive SL")
            }
            
            NavigationLink(destination: ESDSLDissView()){
                Text("ESD Dissipative SL")
            }


            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("ESD Sub-Systems")
    }
}

struct ESDUPCSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
