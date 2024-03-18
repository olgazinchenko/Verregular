//
//  UIStackView+Ex.swift
//  Verregular
//
//  Created by ozinchenko.dev on 18/03/2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
