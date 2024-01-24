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
    @State private var selection = "Parked";
    @State private var trap = false;
    @State private var harmony = false;
    let positions = ["Parked", "Onstage", "None"];
    
    var body: some View {
        //update loop reference
        if !jank {
            TeleopView()
        } else {
            if !progref {
                NotesView()
            } else {
                //code goes here
                GeometryReader {geometry in
                    ZStack {//could make an array
                        backgroundGradient
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
                                                Text($0)
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        
                                        Text("Selected position: \(selection)")
                                        
                                        Toggle("Note in Trap?: ", isOn: $trap).frame(width:150).offset(y: 50)
                                        Toggle("Harmony?: ", isOn: $harmony).frame(width:150).offset(y: 50)
                                    }
                                }
                            }.offset(y: -300)
                            
                            HStack {
                                Text("TO NOTES").font(.title).fontWeight(.bold).onTapGesture {
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

#Preview {
    EndGameView()
}
