//
//  String+Ex.swift
//  Verregular
//
//  Created by ozinchenko.dev on 15/03/2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
