//
//  ColorChipSubSys.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct SelectLineSubSys: View {
    
    

    var body: some View {
        

        List{
            
            NavigationLink(destination: SelectTSView()){
                Text("Epoxy")
            }
            NavigationLink(destination: SelectChipView()){
                Text("Epoxy Chip")
            }
            NavigationLink(destination: SelectPolyView()){
                Text("Polyaspartic")
            }
            NavigationLink(destination: SelectOMGView()){
                Text("OMG Blocker")
            }
            NavigationLink(destination: SelectCoveResinView()) {
                Text("Cove Resin")
            }
            NavigationLink(destination: SelectEConductiveView()) {
                Text("Epoxy Conductive")
            }
            NavigationLink(destination: SelectEDissipativeView()) {
                Text("Epoxy Dissipative")
            }
            NavigationLink(destination: SelectPConductiveView()) {
                Text("Poly Conductive")
            }
            NavigationLink(destination: SelectPDissipativeView()) {
                Text("Poly Dissipative")
            }


        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Select Boxed Kits")
    }
        

}

struct SelectLineSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
