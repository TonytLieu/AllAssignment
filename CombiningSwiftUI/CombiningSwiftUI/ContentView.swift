//
//  ContentView.swift
//  CombiningSwiftUI
//
//  Created by Tony Lieu on 11/20/23.
//
/*
 this is apple own native framework introduced in IoS 12 in 2019 for reactive programing
 -it works well with both SwiftUI and UIKit
 -it has decalrative approch to processing events in wift
 -if X thing will happen in furture then do Y do
 Pulisher
 Subscriber
 Opertator
 \Publisher sucbcurber Model
 
 realtime exmaple
 1.Radio broadcaster(FM)
 2.Newspapers
 3.podcasts
 
 1.Publisher- someone who produced the data or values/ this is prococal it tranmist sequence of values over time
 2.Subsriber - this is the one who consumes the values prduced by publisher this is also protocal
 
 Opertator - this are methosds that are called on publisher and they return published data used for any modifacation
 multiple operators which we can chain together
 
 RXSwift - 3rd party framework
 
 1.Closure
 2. Protocol Delegate
 3.Async Await
 4.Combine
 5.RXSwift/AlmaoFire
 Advantages of Combine 
 1.Simplified async code
 2. Delarative syntax
 3.Cancelating support
 4.Bulidt in mermory managemnt
 5.muitlthreading
 6.multuplaform - execept for Linux
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
