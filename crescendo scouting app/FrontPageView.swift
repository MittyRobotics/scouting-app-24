//
//  FrontPageView.swift
//  practice
//
//  Created by Celine Lou on 1/23/24.
//

import SwiftUI

struct FrontPageView: View {
    @State private var moved = false;
    @State public var red = "Red";
    
    @State public var teamNum = "";
    @State public var matchnum = ""; //estbalished type mamkes binding is quite intituive
    @State public var mobile = false;
    @State public var startingPosition = "";
    @State public var value = 0;
    @State public var amp = 0;
    @State public var left = false;
    @State public var middle = false;
    @State public var teleopSpeaker = 0;
    @State public var teleopAmp = 0
    @State public var selection = "Parked";
    @State public var trap = false;
    @State public var harmony = false;
    @State public var pens = 0;
    @State public var techPens = 0;
    @State public var groundpickup = false;
    @State public var feeder = false;
    @State public var notes = "";
    
    
    let teamColor = ["Red", "Blue"];
    let startingPositions = ["1", "2,", "3", "4", "No show"];
     
    var body: some View {
        if !moved{
            ZStack{
                VStack(alignment: .center, spacing:50)
                {
                    Text("Team Select").foregroundColor(.teal).bold().font(.system(size: 50)).offset(y: -100)
                    
                    VStack{
                        Text("Team Info: ").foregroundColor(.teal).bold().font(.title).offset(y: -110)
                        Picker("Select team color", selection: $red){
                            ForEach(teamColor, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.menu).multilineTextAlignment(.center).fixedSize().font(.title).offset(y:-100)
                        
                        TextField("Team # (required)", text: $teamNum).multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                            .font(.system(size:25))
                            .monospacedDigit()
                            .minimumScaleFactor(4)
                            .offset(y: -80)
                        
                        TextField("Match # (required)", text: $matchnum).multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                            .font(.system(size:25))
                            .monospacedDigit()
                            .minimumScaleFactor(4)
                            .offset(y: -50)
                        //
                        Text("Starting Position:").foregroundColor(.teal).bold().font(.title)
                        
                        Picker("Starting Position", selection: $startingPosition){
                            ForEach(startingPositions, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.menu).multilineTextAlignment(.center).fixedSize().font(.title3)  
                        
                    }
                    
                    //var showDetails = false;
                    if (!String(teamNum).isEmpty && !String(matchnum).isEmpty){
                        HStack{
                            Text("TO AUTON").font(.title).fontWeight(.bold).onTapGesture {
                                moved = true;
                            }
                        }.offset(y: -20)
                    }
                }
            }.offset(y:30)
        }
        else{
            ContentView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
        }
    }
} //llvm reference


