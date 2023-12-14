//
//  NoteAssembly.swift
//  VIPNotes
//
//  Created by Tony Lieu on 12/7/23.
//

import SwiftUI
class NoteAssembly {
    static func assembleModule() -> some View {
        var view = NoteViewImpl()
        let interactor = NoteInteractor()
        let presenter = NotePresenterImpl(view: view)

        view.presenter = presenter
        presenter.interactor = interactor
        interactor.output = presenter

        return view
    }
}
