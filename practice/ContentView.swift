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
struct ContentView: View {
    @State private var value = 0;
    @State private var amp = 0;
    @State private var mobile = false;
    @State private var left = false;
    @State private var middle = false;
    @State private var move = true;
    @State private var jank = true;
    var body: some View {
        if !jank{
            FrontPageView()
        }
        else{
            if !move{
                TeleopView()
            } else{
                GeometryReader {geometry in
                    ZStack {//could make an array
                    backgroundGradient
                        Image(systemName: "arrow.left").font(.title).offset(y: -60).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 100).onTapGesture {
                        jank = false
                        }
                        VStack {
                            Text("AUTONOMOUS").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                            HStack {
                                VStack() {
                                    Text("SPEAKER").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                                    Image(blueSpeaker).resizable().frame(width:318, height: 318).padding(.bottom, 10)
                                    Stepper {
                                        Text("\(value)")
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
                                        Text("\(amp)")
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
                                    Toggle("Mobility: ", isOn: $mobile).frame(width:150)
                                    Toggle("Left Zone: ", isOn: $left).frame(width:150)
                                    Toggle("Middle Ring: ", isOn: $middle).frame(width:150)
                                }
                                
                            }
                            
                            Text("TO TELEOP").font(.title).fontWeight(.bold).onTapGesture {
                                move = false;
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
