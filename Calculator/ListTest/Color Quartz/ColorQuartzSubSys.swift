//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ColorQuartzSubSys: View {
    var body: some View {
        List{
//            HStack {
//                NavigationLink(destination: ChipGarageView()){
//                    Text("Color Chip Garage, 24 mils")
//                }
//            }
            // Epoxy 
            NavigationLink(destination: ColorQuartzUPCSubSys()){
                Text("Color Quartz UPC Sub-Systems")
            }
            NavigationLink(destination: ColorQuartzEpoxySubSys()){
                Text("Color Quartz Epoxy Sub-Sytems")
            }
        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Color Quartz Sub-Systems")
    }
}

struct ColorQuartzSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
