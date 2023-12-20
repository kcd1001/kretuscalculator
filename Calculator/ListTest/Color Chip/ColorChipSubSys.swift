//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ColorChipSubSys: View {
    var body: some View {
        List{
//            HStack {
//                NavigationLink(destination: ChipGarageView()){
//                    Text("Color Chip Garage, 24 mils")
//                }
//            }
            NavigationLink(destination: ChipTSView()){
                Text("Color Chip TS, 35 mils")
            }
            NavigationLink(destination: ChipPAView()){
                Text("Color Chip PA, 35 mils")
            }
            NavigationLink(destination: ChipRCUVView()){
                Text("Color Chip RC UV, 30 mils - 1/6\"")
            }
            NavigationLink(destination: ChipRCView()){
                Text("Color Chip RC, 30 mils - 1/6\"")
            }
            NavigationLink(destination: ChipSLView()){
                Text("Color Chip SL, 1/8\"")
            }

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Color Chip")
    }
}

struct ColorChipSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
