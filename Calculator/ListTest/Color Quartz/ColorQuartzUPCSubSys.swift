//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ColorQuartzUPCSubSys: View {
    
    

    var body: some View {
        

        List{
            // UPC 
            NavigationLink(destination: QuartzRCView()){
                Text("Color Quartz RC, 1/8\"")
            }
            NavigationLink(destination: QuartzTTView()){
                Text("Color Chip TT, 1/4\" - 3/8\"")
            }
            NavigationLink(destination: QuartzSLView()){
                Text("Color Chip SL, 3/16\" - 1/4\"")
            }
            NavigationLink(destination: QuartzMFView()){
                Text("Color Chip MF, 3/16\" - 1/4\"")
            }

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Color Quartz UPC Sub-Systems")
    }
        

}

struct ColorQuartzUPCSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
