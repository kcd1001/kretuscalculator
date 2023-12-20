//
//  PCoatSwitch.swift
//  Calculator
//
//  Created by Kane Davidson on 1/29/21.
//

import SwiftUI

struct PCoatSwitch: View {
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections

    var body: some View {
        HStack{
            switch upcChoiceRC.PCoatSelection {
            case 0:
                Text("EX-KUPCRZ6-EA")
                    .font(.caption)
            case 1:
                Text("EX-KUPCRCA6-EA")
                    .font(.caption)
            case 2:
                Text("EX-KUPCRCF6-EA")
                    .font(.caption)
        
            default:
                Text("")
            }
        
            Spacer()
         
            switch upcChoiceRC.PCoatSelection {
            case 0:
                Text("UPC Part B - RC/TT - EZ, 6 lbs")
                    .font(.caption)
            case 1:
                Text("UPC Part B - RC/TT - AP, 6 lbs")
                    .font(.caption)
            case 2:
                Text("UPC Part B - RC/TT - FC, 6 lbs")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            Text("\(upcChoiceRC.PCoatPtB)")
                .font(.caption)
           
        }
    }
}

struct PCoatSwitch_Previews: PreviewProvider {
    static var previews: some View {
        PCoatSwitch()
    }
}
