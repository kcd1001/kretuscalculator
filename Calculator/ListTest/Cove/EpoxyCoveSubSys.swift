//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct EpoxyCoveSubSys: View {
    var body: some View {
        List{
//            HStack {
//                NavigationLink(destination: ChipGarageView()){
//                    Text("Color Chip Garage, 24 mils")
//                }
//            }
            NavigationLink(destination: CoveColorView()){
                Text("Epoxy Cove Color, 4\" - 6\"")
            }
            NavigationLink(destination: CoveColorChipView()){
                Text("Epoxy Cove Color Chip, 4\" - 6\"")
            }
            NavigationLink(destination: CoveColorQuartzView()){
                Text("Epoxy Cove Color Quartz, 4\" - 6\"")
            }
            NavigationLink(destination: UPCCoveView()){
                Text("UPC Cove, 4-6\"")
            }
//            NavigationLink(destination: ChipRCView()){
//                Text("Color Chip RC, 30 mils - 1/6\"")
//            }
//            NavigationLink(destination: ChipSLView()){
//                Text("Color Chip SL, 1/8\"")
//            }

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Cove")
    }
}

struct EpoxyCoveSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
