//
//  ProgressEmptyContentView.swift
//  SwiftyHUD
//
//  Created by y H on 2025/6/27.
//

import UIKit

public final class ProgressEmptyContentView: UIView, ProgressContentView {
    public typealias Content = ProgressEmptyIndicator

    public let content: ProgressEmptyIndicator

    public init(content: ProgressEmptyIndicator) {
        self.content = content
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
