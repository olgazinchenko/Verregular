//
//  IrregularVerbs.swift
//  MVCLesson
//
//  Created by ozinchenko.dev on 13/03/2024.
//

import Foundation

class IrregularVerbs {
    private(set) var verbs: [Verb] = []
    var selectedVerbs: [Verb] = []
    
    func configureVerbs() {
        verbs = [
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "drow", pastSimple: "drew", participle: "drown"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "drow", pastSimple: "drew", participle: "drown"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "drow", pastSimple: "drew", participle: "drown"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "drow", pastSimple: "drew", participle: "drown"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "drow", pastSimple: "drew", participle: "drown"),
            Verb(infinitive: "eat", pastSimple: "ate", participle: "eaten"),
            Verb(infinitive: "fall", pastSimple: "fell", participle: "fallen")
        ]
    }
}
