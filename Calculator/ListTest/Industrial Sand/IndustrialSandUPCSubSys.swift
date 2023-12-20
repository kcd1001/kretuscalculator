//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct IndustrialSandUPCSubSys: View {
    var body: some View {
        List{
            // UPC
            
            NavigationLink(destination: IndustrialSandRCView()){
                Text("Industrial Sand RC, 1/16\" - 1/8\"")
            }

            NavigationLink(destination: IndustrialSandTTView()){
                Text("Industrial Sand TT, 1/4\" - 3/8\"")
            }
            
            NavigationLink(destination: IndustrialSandSLView()){
                Text("Industrial Sand SL, 3/16\" - 1/4\"")
            }
            
            NavigationLink(destination: IndustrialSandMFView()){
                Text("Industrial Sand MF, 3/16\" - 1/4\"")
            }
            
            NavigationLink(destination: IndustrialSandDBRCView()){
                Text("Industrial Sand DB RC, 3/16\"")
            }
             
            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Industrial Sand UPC Sub-Systems")
    }
}

struct IndustrialSandUPCSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
