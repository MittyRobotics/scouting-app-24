//
//  TeleopView.swift
//  practice
//
//  Created by Celine Lou on 1/20/24.
//

import SwiftUI

struct TeleopView: View {
    @State private var jank = true
    @State private var value = 0;
    @State private var amp = 0;
    @State private var mobile = false;
    @State private var left = false;
    @State private var middle = false;
    @State private var move = false;
    var body: some View {
        //update loop reference
        if jank {
            
            //code goes here
            GeometryReader {geometry in
                ZStack {//could make an array
                    backgroundGradient
                    VStack {
                        ZStack {
                            Text("TELEOP").font(.title).fontWeight(.bold).font(.system(.largeTitle))
                            Image(systemName: "arrow.left").font(.title).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 100).onTapGesture {
                                jank = false
                            }
                            .font(.title).fontWeight(.bold).font(.system(.largeTitle)).offset(y: -20)
                        }
        
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
                            .padding(20)
                        }.offset(y:-100)
                        
                        HStack {
                            
                        }.offset(y:-100)
                        
                        
                        
                    }.offset(y:-50)
                }
                
                
            }
            
            
        } else {
            ContentView()
        }
    }
}

struct TeleopView_Previews: PreviewProvider{
    static var previews: some View{
        TeleopView()
    }
}
