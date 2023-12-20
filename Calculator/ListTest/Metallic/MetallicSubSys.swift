//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct MetallicSubSys: View {
    var body: some View {
        List{
          
            NavigationLink(destination: MetallicView())
            {
                Text("Top Shelf® Metallic, 15-45 WFT")
            }
            
            NavigationLink(destination: MetallicUVView())
            {
                Text("Top Shelf® Metallic UV, 15-45 WFT")
            }
            

        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Metallic Sub-Systems")
    }
}

struct MetallicSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
