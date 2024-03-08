//
//  EndGameView.swift
//  practice
//
//  Created by Celine Lou on 1/23/24.
//

import SwiftUI

struct EndGameView: View {
    
    @State private var jank = true
    @State private var progref = true;
    
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
    @Binding var selection: String; //editing teh ast
    @Binding var trap: Bool;
    @Binding var harmony: Bool;
    @Binding var pens: Int;
    @Binding var techPens: Int;
    @Binding var groundpickup: Bool;
    @Binding var feeder: Bool;
    @Binding var notes: String;
    
    
    
    let positions = ["Parked", "Onstage", "None"];
    
    var body: some View {
        //update loop reference
        if !jank {
            TeleopView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
            
        } else {
            if !progref {
                NotesView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
            } else {
                //code goes here
                GeometryReader {geometry in
                    ZStack {//could make an array
                        red  == "Red" ? redBackgroundGradient : backgroundGradient
                        VStack {
                            ZStack {
                                Text("END GAME").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                Image(systemName: "arrow.left").font(.title).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 100).onTapGesture {
                                    jank = false
                                }
                                .font(.title).fontWeight(.bold).font(.system(.largeTitle)).offset(y: -20)
                            }
                            
                            HStack {
                                VStack {
                                    Text("STAGE").font(.title2).fontWeight(.bold).font(.system(.largeTitle)).offset(x: -200, y: 50)
                                    Image(chain).resizable().frame(width:600, height: 500).padding(.bottom, 10)
                                    
                                }
                                .padding(10)
                            }.offset(y:-130)
                            
                            HStack{
                                VStack(spacing:20) {
                                    VStack{
                                        Picker("Select position", selection: $selection){
                                            ForEach(positions, id: \.self){
                                                Text($0).font(.system(size: 18))
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        
                                        Text("Selected position: \(selection)").font(.system(size: 20))
                                        
                                        Toggle("Note in Trap?: ", isOn: $trap).frame(width:200).offset(y: 50).font(.system(size: 22))
                                        Toggle("Harmony?: ", isOn: $harmony).frame(width:200).offset(y: 50).font(.system(size: 22))
                                    }
                                }
                            }.offset(y: -300)
                            
                            HStack {
                                Text("TO COMMENTS").font(.title).fontWeight(.bold).onTapGesture {
                                    progref = false;
                                }
                            }.offset(y:-240)
                            
                        }.offset(y:-50)
                    }
                    
                }
            }
        }
        
    }
}

//#Preview {
//    EndGameView()
//}



