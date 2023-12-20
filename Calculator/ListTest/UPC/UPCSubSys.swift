//
//  UPCSubSys.swift
//  ListTest
//
//  Created by Kane Davidson on 10/19/20.
//

import SwiftUI

struct UPCSubSys: View {
    
    private let SystemData: [SystemItem] = [
         
            SystemItem(
                System: "UPC 1-Coat",
                SubSys: "UPC RC (roll coat), 10-30 mils "
                 ),
             
            SystemItem(
                System: "UPC 1-Coat",
                SubSys: "UPC SL (self leveler), 1/8-1/4 in. "
                 ),
             
            SystemItem(
                System: "UPC 1-Coat",
                SubSys: "UPC MF (medium fill, self-leveler), 1/8-1/4 in. "
                 ),
             
            SystemItem(
                System: "UPC 1-Coat",
                SubSys: "UPC TT (trowel applied), 1/4-4 in."
                ),
            SystemItem(
                System: "UPC 1-Coat",
                SubSys: "UPC UV (UV-Resistance), 10-30 mils"
                ),
            ]
    
        var body: some View {
                List{
                    HStack {
                        NavigationLink(destination: UPCRC()){
                            Text("UPC RC (roll coat), 10-30 mils")
                        }
                    }
                    NavigationLink(destination: UPCSL()){
                        Text("UPC SL (self leveler), 1/8-1/4 in.")
                    }
                    NavigationLink(destination: UPCMF()){
                        Text("UPC MF (medium fill, self-leveler), 1/8-1/4 in.")
                    }
                    NavigationLink(destination: UPCTT()){
                        Text("UPC TT (trowel applied), 1/4-4 in.")
                    }
                    NavigationLink(destination: UPCUV()){
                        Text("UPC UV (UV-Resistance), 10-30 mils")
                    }
                }.opacity(0.8)
                .background(KretusLogo())
                .navigationBarTitle("UPC 1-Coat")
                }
        }
    


    struct SystemItem: Identifiable {
        let System: String
        let SubSys: String
        let id = UUID()
    }


struct UPCSubSys_Previews: PreviewProvider {
    
    static var previews: some View {
        UPCSubSys()
    }
}
