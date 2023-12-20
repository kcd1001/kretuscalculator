//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct IndustrialSandEpoxySubSys: View {
    var body: some View {
        List{
            // Epoxy
            NavigationLink(destination: IndustrialSandTSView()){
                Text("Industrial Sand TS, 1/8\"")
            }
            NavigationLink(destination: IndustrialSandDBTSView()){
                Text("Industrial Sand DB TS, 3/16\"")
            }
            NavigationLink(destination: IndustrialSandSGView()){
                Text("Industrial Sand SG, 3/16\" - 1/4\"")
            }
            NavigationLink(destination: IndustrialSandTGView()){
                Text("Industrial Sand TG, 1/4\" - 3/8\"")
            }
            /*
            NavigationLink(destination: QuartzMFView()){
                Text("Industrial Sand RC, 1/16\" - 1/8\"")
            }
            NavigationLink(destination: QuartzMFView()){
                Text("Industrial Sand DB RC, 3/16\"")
            }
            NavigationLink(destination: QuartzMFView()){
                Text("Industrial Sand SL, 3/16\" - 1/4\"")
            }
            NavigationLink(destination: QuartzMFView()){
                Text("Industrial Sand MF, 3/16\" - 1/4\"")
            }
            NavigationLink(destination: QuartzMFView()){
                Text("Industrial Sand TT, 1/4\" - 3/8\"")
            }
             */
            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Industrial Sand Epoxy Sub-Systems")
    }
}

struct IndustrialSandEpoxySubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
