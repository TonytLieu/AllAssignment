//
//  Interactor.swift
//  VIPNotes
//
//  Created by Tony Lieu on 12/7/23.
//

protocol NoteInteractorInput {
    func getNote()
}

protocol NoteInteractorOutput: AnyObject {
    func present(note: String)
}

class NoteInteractor: NoteInteractorInput {
    weak var output: NoteInteractorOutput!

    func getNote() {
        // Simulate fetching a note from the data layer
        let note = "This is a sample note"
        output.present(note: note)
    }
}
