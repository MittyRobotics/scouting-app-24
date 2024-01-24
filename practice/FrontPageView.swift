//
//  FrontPageView.swift
//  practice
//
//  Created by Celine Lou on 1/23/24.
//

import SwiftUI

struct FrontPageView: View {
    @State private var moved = false;

    var body: some View {
        if !moved{
            Text("Team Select").foregroundColor(.teal).bold().font(.largeTitle).offset(y: -200)
            HStack{
                Text("TO AUTON").font(.title).fontWeight(.bold).onTapGesture {
                    moved = true;
                }
            }.offset(y: 300)
        }
        else{
            ContentView()
        }
    }
}

#Preview {
    FrontPageView()
}
