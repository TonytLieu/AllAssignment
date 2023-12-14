//
//  Presenter.swift
//  VIPNotes
//
//  Created by Tony Lieu on 12/7/23.
//

protocol NotePresenter {
    func viewDidLoad()
}

class NotePresenterImpl: NotePresenter, NoteInteractorOutput {
    var view: (any NoteView)?
    var interactor: NoteInteractorInput!

    init(view: any NoteView) {
        self.view = view
        self.view?.presenter = self
    }

    // Implement NotePresenter protocol
    func viewDidLoad() {
        interactor.getNote()
    }

    // Implement NoteInteractorOutput protocol
    func present(note: String) {
        //view.displayedNote = note
    }
}
