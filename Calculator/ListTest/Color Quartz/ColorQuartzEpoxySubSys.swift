//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ColorQuartzEpoxySubSys: View {
    var body: some View {
        List{

            NavigationLink(destination: QuartzTSView()){
                Text("Color Quartz TS, 1/8\"")
            }
            NavigationLink(destination: QuartzDBView()){
                Text("Color Quartz DB, 3/16\"")
            }
            NavigationLink(destination: QuartzSGView()){
                Text("Color Quartz SG, 3/16\"-1/4\"")
            }


        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Color Quartz Epoxy Sub-Systems")
    }
}

struct ColorQuartzEpoxySubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
