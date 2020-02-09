//
//  ConstraintUpdater.swift
//  UILayoutBuilder
//
//  Created by marty-suzuki on 2020/02/09.
//

import UIKit

final class ConstraintUpdater {

    private(set) var constraint: NSLayoutConstraint

    init(_ constraint: NSLayoutConstraint) {
        self.constraint = constraint
    }

    func update(multiplier: CGFloat? = nil,
                constant: CGFloat? = nil,
                priority: UILayoutPriority? = nil) {
        let new = NSLayoutConstraint(
            item: constraint.firstItem ?? { fatalError("use \(type(of: self)) after equalTo (greaterThan, lessThan).") }(),
            attribute: constraint.firstAttribute,
            relatedBy: constraint.relation,
            toItem: constraint.secondItem,
            attribute: constraint.secondAttribute,
            multiplier: multiplier ?? constraint.multiplier,
            constant: constant ?? constraint.constant
        )
        new.priority = priority ?? constraint.priority
        self.constraint = new
    }
}
