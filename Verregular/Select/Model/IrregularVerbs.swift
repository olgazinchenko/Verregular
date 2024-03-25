//
//  IrregularVerbs.swift
//  MVCLesson
//
//  Created by ozinchenko.dev on 13/03/2024.
//

import Foundation

final class IrregularVerbs {
    // Singleton
    static var shared = IrregularVerbs()
    private init() {
        configureVerbs()
        selectedVerbs = verbs
    }
    // MARK: - Properties
    var selectedVerbs: [Verb] = []
    private(set) var verbs: [Verb] = []
    
    // MARK: - Methods
    private func configureVerbs() {
        verbs = [
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "drow", pastSimple: "drew", participle: "drown"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen")
        ]
    }
}
