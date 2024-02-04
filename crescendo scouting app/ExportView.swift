//
//  ExportPage.swift
//  crescendo scouting app
//
//  Created by Celine Lou on 1/27/24.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers
import CoreImage.CIFilterBuiltins

struct MessageDocument: FileDocument{
    static var readableContentTypes: [UTType] { [.plainText] }
    var message: String
    init(message: String){
        self.message = message
    }
    init(configuration: ReadConfiguration) throws{
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else{
            throw CocoaError(.fileReadCorruptFile)
        }
        message = string
    }
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper{
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

struct ExportView: View {
    @State private var jank = true;
    @State var show = false;
    @State var showingExporter: Bool = false
    @Binding var red: String;
    @Binding var teamNum: String;
    @Binding var userName : String;
    @Binding var matchnum: String;
    @Binding var mobile: Bool;
    @Binding var defending: Bool;
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
    @Binding var groundpickup: Bool;
    @Binding var feeder: Bool;
    @Binding var pens: Int;
    @Binding var techPens: Int;
    @Binding var notes: String;
    @State var sillious = false;

    var tt: String{
        get{
            return "YOURNAME: " + userName + "\nTEAMNUM: " + teamNum + "\nMATCHNUM_TEAMNUM: " + matchnum + "_" + teamNum + "\nMATCHNUM: " + matchnum + "\nMOBILITY: " + String(mobile) + "\nDEFENDING: " + String(defending) + "\nSTARTINGPOS: " + startingPosition + "\nAUTONSPEAKER: " + String(value) + "\nAUTONAMP: " + String(amp) + "\nCENTERRING: " + String(middle) + "\nTELEOPSPEAKER: " + String(teleopSpeaker) + "\nTELEOPAMP: " + String(teleopAmp) + "\nENDGAME: " + selection + "\nTRAP: " + String(trap) + "\nHARMONY: " + String(harmony) + "\nGROUNDPICKUP: " + String(groundpickup) + "\nFEEDER: " + String(feeder) + "\nPENALTIES: " + String(pens) + "\nTECHPENALTIES: " + String(techPens) + "\nNOTES: " + notes
        }
    }
    
    var document: MessageDocument{
        get{
            return MessageDocument(message: "YOURNAME: " + userName + "\nTEAMNUM: " + teamNum + "\nMATCHNUM_TEAMNUM: " + matchnum + "_" + teamNum + "\nMATCHNUM: " + matchnum + "\nMOBILITY: " + String(mobile) + "\nDEFENDING: " + String(defending) + "\nSTARTINGPOS: " + startingPosition + "\nAUTONSPEAKER: " + String(value) + "\nAUTONAMP: " + String(amp) + "\nCENTERRING: " + String(middle) + "\nTELEOPSPEAKER: " + String(teleopSpeaker) + "\nTELEOPAMP: " + String(teleopAmp) + "\nENDGAME: " + selection + "\nTRAP: " + String(trap) + "\nHARMONY: " + String(harmony) + "\nGROUNDPICKUP: " + String(groundpickup) + "\nFEEDER: " + String(feeder) + "\nPENALTIES: " + String(pens) + "\nTECHPENALTIES: " + String(techPens) + "\nNOTES: " + notes)
        }
    }
    
    @State private var isImporting: Bool = false;
    @State private var isExporting: Bool = false;

    
    var body: some View {
        if !sillious {
            if !jank{
                NotesView(red: $red, teamNum: $teamNum, matchnum: $matchnum, mobile: $mobile, startingPosition: $startingPosition, value: $value, amp: $amp, left: $left, middle: $middle, teleopSpeaker: $teleopSpeaker, teleopAmp: $teleopAmp, selection: $selection, trap: $trap, harmony: $harmony, pens: $pens, techPens: $techPens, groundpickup: $groundpickup, feeder: $feeder, notes: $notes)
            } else{
                Image(systemName: "arrow.left").font(.title).fontWeight(.bold).frame(maxWidth:.infinity, maxHeight:.infinity,  alignment:.topLeading).padding(.horizontal, 50).padding(.vertical, 20).onTapGesture {
                    jank = false
                }
                VStack(spacing:20){
                    Text(tt).frame(height:500).padding(20).border(.black).offset(y: -50) //es sequential members
                    GroupBox{
                        HStack{
                            Spacer()
                            Button(action: { isExporting = true }, label: {
                                Text("Export").font(.system(size:20, weight: .bold))
                            })
                            Spacer()
                        }
                    }.offset(y:-40)
                    Button("To Starting Page", action: {
                        show = true
                    }).offset(y:-40).font(.system(size: 35, weight: .bold)).foregroundColor(.blue).alert(isPresented: $show) {
                        Alert(title: Text("U sure bro?"),
                              message: Text("You're gonna lose your data if you leave bro"),
                              primaryButton: .destructive(Text("yea im sure"), action: {
                            show = false
                            sillious = true
                            //close on default
                        }), secondaryButton: .default(Text("no mb"), action: {
                            
                        }))
                    }
                }
                .fileExporter(
                    isPresented: $isExporting,
                    document: document,
                    contentType: .plainText,
                    defaultFilename: "match" + String(matchnum) + "_team" + String(userName)
                )  { result in
                    if case .success = result {
                        //nothing
                    } else {
                        //alert
                    }
                }
                
                
                
                
            }
            
        } else {
            FrontPageView() //jank since navview
        }
    }

}




///
///#Preview {
///    ExportView()
///}
