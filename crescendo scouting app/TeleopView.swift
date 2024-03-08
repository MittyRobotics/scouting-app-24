//
//  TeleopView.swift
//  practice
//
//  Created by Celine Lou on 1/20/24.
//

import SwiftUI

struct TeleopView: View {
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
    var body: some View {
        //update loop reference
        if !jank {
            ContentView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
        } else {
            if !progref {
                EndGameView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
            } else {
                //code goes here
                GeometryReader { geo in
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
                                    Image(blueSpeaker).resizable().frame(width:218, height: 218).padding(.bottom, 10)
                                    VStack{
                                        Text("\(teleopSpeaker)").font(.system(size:30)).fontWeight(.bold).padding(15)
                                        HStack{
                                            HStack{
                                                Text("-").foregroundColor(.white).font(.system(size:50)).padding(20).padding(.leading, 100).padding(.trailing, 100)
                                            }.background(Color.red).border(.black).contentShape(Rectangle()).onTapGesture {
                                                if (teleopSpeaker > 0){
                                                    teleopSpeaker -= 1;
                                                }
                                            }
                                            HStack{
                                                Text("+").foregroundColor(.white).font(.system(size:50)).padding(20).padding(.leading, 100).padding(.trailing, 100)
                                            }.background(Color.green).border(.black).contentShape(Rectangle()).onTapGesture {
                                                teleopSpeaker += 1;
                                            }
                                        }
                                    }
                                }
                                .padding(10)
                                VStack(spacing: 10) {
                                    Text("AMP").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                    Image(blueAmp).resizable().frame(width:218, height:218).padding(.bottom, 10)
                                    VStack{
                                        Text("\(teleopAmp)").font(.system(size:30)).fontWeight(.bold).padding(15)
                                        HStack{
                                            HStack{
                                                Text("-").foregroundColor(.white).font(.system(size:50)).padding(20).padding(.leading, 100).padding(.trailing, 100)
                                            }.background(Color.red).border(.black).contentShape(Rectangle()).onTapGesture {
                                                if (teleopAmp > 0){
                                                    teleopAmp -= 1;
                                                }
                                            }
                                            HStack{
                                                Text("+").foregroundColor(.white).font(.system(size:50)).padding(20).padding(.leading, 100).padding(.trailing, 100)
                                            }.background(Color.green).border(.black).contentShape(Rectangle()).onTapGesture {
                                                teleopAmp += 1;
                                            }
                                        }
                                    }
                                }
                                .padding(20)
                            }.offset(y:-100)
                            
                            HStack{
                                VStack{
                                    Toggle("Picked up from Ground? ", isOn: $groundpickup).frame(width:300).font(.system(size: 22))
                                }
                            }.offset(y:-75)
                            
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
