//
//  UIView+Ex.swift
//  Verregular
//
//  Created by ozinchenko.dev on 18/03/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
