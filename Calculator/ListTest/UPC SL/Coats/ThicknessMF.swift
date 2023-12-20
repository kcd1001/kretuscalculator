//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessMF: View {
    
@EnvironmentObject var UPCAMF : stats
@EnvironmentObject var UPCBMF : stats
@EnvironmentObject var UPCCMF : stats
@EnvironmentObject var color : Colorant
@EnvironmentObject var upc : options
        
let thickness = ["1/8\"", "3/16\"", "1/4\""]
    

    

    var body: some View {
        VStack {
            HStack {
                Text("Coating Thickness")
                    .fontWeight(.heavy)
                Spacer()
                UPCMFInfo()
            }.padding()
            Picker(selection: $upc.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: upc.ThicknessSelection) { _ in
                if upc.ThicknessSelection == 0 {
                    UPCAMF.covRate = 60
                    UPCBMF.covRate = 60
                    UPCBMF.covRate = 60
                    
                }
                if upc.ThicknessSelection == 1 {
                    UPCAMF.covRate = 35
                    UPCBMF.covRate = 35
                    UPCBMF.covRate = 35
                    
                }
                if upc.ThicknessSelection == 2 {
                    UPCAMF.covRate = 25
                    UPCBMF.covRate = 25
                    UPCBMF.covRate = 25
                   
                }
            }
        }
    }
}


struct Thickness_PreviewsMF: PreviewProvider {
    static let test1 = stats(product: "Urethane Polymer Concrete Part A:", covRate: 200, MixRat: 6)
    static let test2 = stats(product: "Urethane Polymer Concrete Part B:", covRate: 200, MixRat: 6)
    static let test3 = stats(product: "Urethane Polymer Concrete Part C:", covRate: 200, MixRat: 6)
    static var previews: some View {
        Thickness()
            .environmentObject(test1)
            .environmentObject(test2)
            .environmentObject(test3)
    }
}
