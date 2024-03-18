//
//  Verb.swift
//  MVCLesson
//
//  Created by ozinchenko.dev on 13/03/2024.
//

import Foundation

struct Verb {
    let infinitive: String
    let pastSimple: String
    let participle: String
    var translation: String {
        NSLocalizedString(self.infinitive, comment: "")
    }
}
