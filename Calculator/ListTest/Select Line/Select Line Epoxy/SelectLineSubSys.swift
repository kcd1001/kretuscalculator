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
            
            NavigationLink(destination: SelectChipTSView()){
                Text("Kretus Select Epoxy, 3-5 mils")
            }
            NavigationLink(destination: SelectPolyView()){
                Text("Kretus Select Poly")
            }
            NavigationLink(destination: SelectOMGView()){
                Text("Kretus Select OMG Blocker")
            }
            NavigationLink(destination: SelectCoveResinView()) {
                Text("Kretus Select Cove Resin")
            }
            NavigationLink(destination: SelectEConductiveView()) {
                Text("Kretus Select Epoxy Conductive")
            }
            NavigationLink(destination: SelectEDissipativeView()) {
                Text("Kretus Select Epoxy Dissipative")
            }
            NavigationLink(destination: SelectPConductiveView()) {
                Text("Kretus Select Poly Conductive")
            }
            NavigationLink(destination: SelectPDissipativeView()) {
                Text("Kretus Select Poly Dissipative")
            }


        }.opacity(0.8)
        .background(KretusLogo())
        .navigationBarTitle("Kretus Select Line Sub-Systems")
    }
        

}

struct SelectLineSubSys_Previews: PreviewProvider {
    static var previews: some View {
        ColorChipSubSys()
    }
}
