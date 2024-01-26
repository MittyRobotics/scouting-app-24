//
//  NotesView.swift
//  practice
//
//  Created by Celine Lou on 1/23/24.
//

import SwiftUI

struct NotesView: View {
    @State private var defending = false; //comptime vs ru -gaurav
    @State private var groundpickup = false;
    @State private var feeder = false;
    @State private var llvm = "";
    @State private var jank = true; //jank
    var body: some View {
        if jank {
            ZStack {
                Image(systemName: "arrow.left").font(.title).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 20).onTapGesture {
                    jank = false
                }
                VStack {
                    Text("NOTES:")
                    Toggle("Defending: ", isOn: $defending).frame(width:200)
                    Toggle("Picked up from Ground?: ", isOn: $groundpickup).frame(width:200)
                    Toggle("Feeder?: ", isOn: $feeder).frame(width:200)
                    TextField("Notes:", text:$llvm).frame(width:150).padding(20).padding(EdgeInsets(top:50, leading:25, bottom:50, trailing:25))
                    
                }.padding(20).border(.black)
            }
        } else {
            EndGameView()
        }
        
        
        
    }
}

#Preview {
    NotesView()
}
