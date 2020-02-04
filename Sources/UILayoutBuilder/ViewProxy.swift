//
//  ViewProxy.swift
//  UILayoutBuilder
//
//  Created by marty-suzuki on 2020/02/05.
//

import UIKit

public struct ViewProxy<View: UIView> {

    public var leading: LayoutXAxis { .init(view, for: \.leadingAnchor) }
    public var trailing: LayoutXAxis  { .init(view, for: \.trailingAnchor) }
    public var left: LayoutXAxis { .init(view, for: \.leftAnchor) }
    public var right: LayoutXAxis { .init(view, for: \.rightAnchor) }
    public var top: LayoutYAxis { .init(view, for: \.topAnchor) }
    public var bottom: LayoutYAxis { .init(view, for: \.bottomAnchor) }
    public var width: LayoutDimension { .init(view, for: \.widthAnchor) }
    public var height: LayoutDimension { .init(view, for: \.heightAnchor) }
    public var centerX: LayoutXAxis { .init(view, for: \.centerXAnchor) }
    public var centerY: LayoutYAxis { .init(view, for: \.centerYAnchor) }
    public var firstBaseline: LayoutYAxis { .init(view, for: \.firstBaselineAnchor) }
    public var lastBaseline: LayoutYAxis { .init(view, for: \.lastBaselineAnchor) }

    private let view: View

    init(_ view: View) {
        self.view = view
    }
}

extension ViewProxy {

    public func addSubview<View: UIView>(_ subview: View, handler: ((ViewProxy<View>) -> Void)? = nil) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        handler?(ViewProxy<View>(subview))
    }
}
