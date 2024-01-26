//
//  FrontPageView.swift
//  practice
//
//  Created by Celine Lou on 1/23/24.
//

import SwiftUI

struct FrontPageView: View {
    @State private var moved = false;
    @State public var selection = "Red";
    @State public var matchNum = "";
    @State public var startingPosition = "1";
    @State public var teamNum = "";
    let teamColor = ["Red", "Blue"];
    let startingPositions = ["1", "2,", "3", "4", "No show"];

    var body: some View {
        if !moved{
            ZStack{
                VStack(alignment: .center, spacing:50){
                    Text("Team Select").foregroundColor(.teal).bold().font(.system(size: 50)).offset(y: -100)
                    
                    VStack{
                        Text("Team Info: ").foregroundColor(.teal).bold().font(.title).offset(y: -110)
                        Picker("Select team color", selection: $selection){
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
                        
                        TextField("Match # (required)", text: $matchNum).multilineTextAlignment(.center)
                            .foregroundColor(.blue)
                            .font(.system(size:25))
                            .monospacedDigit()
                            .minimumScaleFactor(4)
                            .offset(y: -50)
                        
                        Text("Starting Position:").foregroundColor(.teal).bold().font(.title)
                        
                        Picker("Starting Position", selection: $startingPosition){
                            ForEach(startingPositions, id: \.self){
                                Text($0)
                            }
                        }.pickerStyle(.menu).multilineTextAlignment(.center).fixedSize().font(.title3)
                        
                    }
                    
                    var showDetails = false;
                    if (!String(teamNum).isEmpty && !String(matchNum).isEmpty){
                        HStack{
                            Text("TO AUTON").font(.title).fontWeight(.bold).onTapGesture {
                                moved = true;
                            }
                        }.offset(y: 50)
                    }
                }
            }
        }
        else{
            ContentView()
        }
    }
}

#Preview {
    FrontPageView()
}
