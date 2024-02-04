//
//  NotesView.swift
//  practice
//
//  Created by Celine Lou on 1/23/24.
//

import SwiftUI

struct NotesView: View {
    @State public var defending = false; //comptime vs ru -gaurav
    @State public var userName = "";
    
    @Binding var red: String;
    @Binding var teamNum : String;
    @Binding var matchnum: String;
    @Binding var mobile: Bool;
    @Binding var startingPosition: String;
    @Binding var value: Int;
    @Binding var amp: Int;
    @Binding var left: Bool;
    @Binding var middle: Bool;
    @Binding var teleopSpeaker: Int;
    @Binding var teleopAmp: Int;
    @Binding var selection: String;
    @Binding var trap: Bool;
    @Binding var harmony: Bool;
    @Binding var pens: Int;
    @Binding var techPens: Int;
    @Binding var groundpickup: Bool;
    @Binding var feeder: Bool;
    @Binding var notes: String;

    @State private var jank = true; //jank
    @State private var progref = true;
    
    
    var body: some View {
        if !jank {
            EndGameView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
        }
        else{
            if (!progref){
                ExportView(red: $red, teamNum: $teamNum, userName: $userName, matchnum: $matchnum, mobile: $mobile, defending: $defending, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, groundpickup: $groundpickup, feeder: $feeder, pens: $pens, techPens: $techPens, notes: $notes);
            }else{
                ZStack {
                    red  == "Red" ? redBackgroundGradient : backgroundGradient

                    Image(systemName: "arrow.left").font(.title).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 20).onTapGesture {
                        jank = false
                    }
                    VStack {
                        Text("NOTES:")
                        
                        TextField("Your name (required): ", text:$userName).frame(width:400).padding(20)
                        
                        Toggle("Defense? ", isOn: $defending).frame(width:400)
                        Toggle("Picked up from Ground? ", isOn: $groundpickup).frame(width:400)
                        Toggle("Feeder? ", isOn: $feeder).frame(width:400)
                        
                        VStack{
                            Stepper{
                                Text("Penalties: " + String(pens))
                            } onIncrement: {
                                pens += 1;
                            } onDecrement: {
                                pens -= 1;
                            }
                            
                            Stepper{
                                Text("Technical Penalties: " + String(techPens))
                            } onIncrement: {
                                techPens += 1;
                            } onDecrement: {
                                techPens -= 1;
                            }
                        }.frame(width: 400).padding(20)
                        
                        TextField("Notes:", text:$notes).frame(width:400).padding(20)
                            //.padding(EdgeInsets(top:50, leading:25, bottom:50, trailing:25))
                        
                        
                    }.padding(20).border(.black)
                    
                    
                    
                    HStack {
                        if (!String(userName).isEmpty){
                            Text("TO EXPORT").font(.title).fontWeight(.bold).onTapGesture {
                                progref = false;
                            }
                        }
                    }.offset(y:260)
                }
            }
        }
    }
}

//#Preview {
//    NotesView()
//}


