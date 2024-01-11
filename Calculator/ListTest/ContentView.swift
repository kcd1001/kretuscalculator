//
//  ContentView.swift
//  ListTest
//
//  Created by Kane Davidson on 10/19/20.
//

import SwiftUI

struct ContentView: View {
   
   

    var body: some View {
                        NavigationView {
                                List {
                                    NavigationLink(destination: UPCSubSys())
                                        {
                                        Text("UPC 1-Coat")
                                        }
                                    NavigationLink(destination: ColorChipSubSys())
                                        {
                                        Text("Color Chip")
                                        }
                                    NavigationLink(destination: ColorSplashFloorSubSys())
                                    {
                                        Text("Color Splash Floor Sealers")
                                    }
                                    NavigationLink(destination: EpoxyMVRView())
                                    {
                                        Text("Epoxy MVR")
                                    }
                                    NavigationLink(destination: EpoxyCoveSubSys())
                                    {
                                        Text("Cove")
                                    }
                                    NavigationLink(destination: ColorQuartzSubSys())
                                    {
                                        Text("Color Quartz")
                                    }
                                    NavigationLink(destination: IndustrialSandSubSys())
                                    {
                                        Text("Industrial Sand")
                                    }
                                    NavigationLink(destination: MetallicSubSys())
                                    {
                                        Text("Metallic")
                                    }
                                    NavigationLink(destination: ESDSubSys())
                                    {
                                        Text("ESD (Static Control)")
                                    }
                                    NavigationLink(destination: SelectLineSubSys())
                                    {
                                        Text("Select Line")
                                    }
                                }
                                .opacity(0.8)
                                .background(KretusLogo())
                                .navigationBarTitle(Text("System Calculator"))
                        }
  
    }
}


struct ContentView_Previews: PreviewProvider {
    
   
    static var previews: some View {
        ContentView()
    }
}
