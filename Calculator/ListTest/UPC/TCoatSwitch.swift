//
//  TCoatSwitch.swift
//  Calculator
//
//  Created by Kane Davidson on 1/29/21.
//

import SwiftUI

struct TCoatSwitch: View {
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options
    var body: some View {
        HStack{
            switch upcChoiceRC.TCoatSelection {
            case 0:
                Text("EX-KUPCRZ6-EA")
                    .font(.caption)
            case 1:
                Text("EX-KUPCRCA6-EA")
                    .font(.caption)
            case 2:
                Text("EX-KUPCRCF6-EA")
                    .font(.caption)
            case 3:
                Text("EX-KUPCRCA6-EA")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            switch upcChoiceRC.TCoatSelection {
            case 0:
                Text("UPC Part B - RC/TT - EZ, 6 lbs")
                    .font(.caption)
            case 1:
                Text("UPC Part B - RC/TT - AP, 6 lbs")
                    .font(.caption)
            case 2:
                Text("UPC Part B - RC/TT - FC, 6 lbs")
                    .font(.caption)
            case 3:
                Text("UPC Part B - RC UV AP, 6 lbs")
                    .font(.caption)
            default:
                Text("")
            }
            Spacer()
            Text("\(upcChoiceRC.TCoatPtB)")
                .font(.caption)
        }
    
        }
    }


struct TCoatSwitch_Previews: PreviewProvider {
    static var previews: some View {
        TCoatSwitch()
    }
}
