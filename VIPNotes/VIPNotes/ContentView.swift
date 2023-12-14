//
//  ContentView.swift
//  VIPNotes
//
//  Created by Tony Lieu on 12/7/23.
//

import SwiftUI

protocol NoteView: View {
    var presenter: NotePresenter! { get set }
}

struct NoteViewImpl: NoteView {
    @State private var displayedNote: String = ""

    var presenter: NotePresenter!

    var body: some View {
        VStack {
            Text("Note:")
            Text(displayedNote)
                .padding()

            Button("Fetch Note") {
                presenter.viewDidLoad()
            }
        }
    }
}
#Preview {
    NoteViewImpl()
}
