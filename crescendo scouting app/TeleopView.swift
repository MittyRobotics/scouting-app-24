//
//  TeleopView.swift
//  practice
//
//  Created by Celine Lou on 1/20/24.
//

import SwiftUI

struct TeleopView: View {
    @State private var teleopSpeaker = 0;
    @State private var teleopAmp = 0;
    @State private var jank = true
    @State private var move = false;
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
    
    var body: some View {
        //update loop reference
        if !jank {
            ContentView(red: $red, teamNum: $teamNum, matchnum: $matchnum, startingPosition: $startingPosition)
        } else {
            if !progref {
                EndGameView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp)
            } else {
                //code goes here
                GeometryReader {geometry in
                    ZStack {//could make an array
                        red  == "Red" ? redBackgroundGradient : backgroundGradient
                        VStack {
                            ZStack {
                                Text("TELEOP").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                Image(systemName: "arrow.left").font(.title).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 100).onTapGesture {
                                    jank = false
                                }
                                .font(.title).fontWeight(.bold).font(.system(.largeTitle)).offset(y: -20)
                            }
                            
                            HStack {
                                VStack {
                                    Text("SPEAKER").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                    Image(blueSpeaker).resizable().frame(width:318, height: 318).padding(.bottom, 10)
                                    Stepper {
                                        Text("\(teleopSpeaker)").font(.system(size: 30))
                                    } onIncrement: {
                                        teleopSpeaker += 1
                                        
                                    } onDecrement: {
                                        if (teleopSpeaker > 0) {
                                            teleopSpeaker -= 1
                                        }
                                    }.frame(width:150)
                                }
                                .padding(10)
                                VStack(spacing: 10) {
                                    Text("AMP").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                    Image(blueAmp).resizable().frame(width:318, height: 318).padding(.bottom, 10)
                                    Stepper {
                                        Text("\(teleopAmp)").font(.system(size: 30))
                                    } onIncrement: {
                                        teleopAmp += 1
                                        
                                    } onDecrement: {
                                        if (teleopAmp > 0) {
                                            teleopAmp -= 1
                                        }
                                    }.frame(width:150)
                                }
                                .padding(20)
                            }.offset(y:-100)
                            
                            HStack {
                                Text("TO END GAME").font(.title).fontWeight(.bold).onTapGesture {
                                    progref = false;
                                }
                            }.offset(y:-50)
                            
                        }.offset(y:-50)
                    }
                    
                }
            }
        }
        
    }
}

//struct TeleopView_Previews: PreviewProvider{
//    static var previews: some View{
//        TeleopView(red: self.$red)
//    }
//}
