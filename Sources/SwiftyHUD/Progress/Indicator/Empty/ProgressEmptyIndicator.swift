//
//  ProgressEmptyIndicator.swift
//  SwiftyHUD
//
//  Created by y H on 2025/6/27.
//

public struct ProgressEmptyIndicator: ProgressIndicator {
    public typealias View = ProgressEmptyContentView

    /// Default instance
    public static let `default` = Self()
}
