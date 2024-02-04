//
//  ContentView.swift
//  practice
//
//  Created by Celine Lou on 1/20/24.
//

import SwiftUI

let blueSpeaker = "blue speaker"
let blueAmp = "blue amp"
let redSpeaker = "red speaker"
let redAmp = "red amp"
let chain = "chain"

let backgroundGradient = LinearGradient(colors: [Color.blue, Color.white], startPoint: .top, endPoint: .bottom)
let redBackgroundGradient = LinearGradient(colors: [Color.red, Color.white], startPoint: .top, endPoint: .bottom)
struct ContentView: View {
    

    @State private var move = true;
    @State private var jank = true;
    
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
    
    @State var showAlert = false;
    
    
    
    var body: some View {
        if !jank{
            FrontPageView()
        }
        else{
            if !move{
                TeleopView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
            } else{
                GeometryReader {geometry in
                    ZStack {//could make an array
                        red  == "Red" ? redBackgroundGradient : backgroundGradient
                            //i lvoe string comparison rather than bpassing in boiolean expression
                        Button {
                            showAlert = true
                        } label: {
                            Image(systemName: "arrow.left").foregroundColor(.black)
                        }.font(.title).offset(y: -60).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 100).alert(isPresented: $showAlert) {
                            Alert(title: Text("U sure bro?"),
                                  message: Text("You're gonna lose your data if you leave bro"),
                                  primaryButton: .destructive(Text("yea im sure"), action: {
                                jank = false
                                //close on default
                            }), secondaryButton: .default(Text("no mb"), action: {
                                
                            }))
                            
                        }
                        VStack {
                            Text("AUTONOMOUS").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                            HStack {
                                VStack() {
                                    Text("SPEAKER").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                    Image(blueSpeaker).resizable().frame(width:318, height: 318).padding(.bottom, 10)
                                    Stepper {
                                        Text("\(value)").font(.system(size: 30))
                                    } onIncrement: {
                                        value += 1
                                        
                                    } onDecrement: {
                                        if (value > 0) {
                                            value -= 1
                                        }
                                    }.frame(width:150)
                                }
                                .padding(10)
                                VStack(spacing: 10) {
                                    Text("AMP").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                    Image(blueAmp).resizable().frame(width:318, height: 318).padding(.bottom, 10)
                                    Stepper {
                                        Text("\(amp)").font(.system(size: 30))
                                    } onIncrement: {
                                        amp += 1
                                        
                                    } onDecrement: {
                                        if (amp > 0) {
                                            amp -= 1
                                        }
                                    }.frame(width:150)
                                }
                                .padding(10)
                            }
                            HStack {
                                
                                VStack {
                                    Toggle("Mobility: ", isOn: $mobile).frame(width:200).font(.system(size: 22))
                                    //Toggle("Left Zone: ", isOn: $left).frame(width:200).font(.system(size: 22))
                                    Toggle("Center Ring: ", isOn: $middle).frame(width:200).font(.system(size: 22))
                                }
                                
                            }.offset(y:10)
                            
                            Text("TO TELEOP").font(.title).fontWeight(.bold).onTapGesture {
                                move = false;
                            }.offset(y:42)
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView(red: self.$red)
//}
