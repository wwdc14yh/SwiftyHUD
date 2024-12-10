// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

/// The SwiftyHUD can display loading information, action or errors, blocking the user interface.
///
/// The SwiftyHUD is displayed on top of the `UIWindow` with a dimmed background and progress in the center of the screen.
/// The style and progress of the SwiftyHUD is fully customizable.
/// Use the ``progress`` and ``style`` properties for this.
@MainActor
public struct SwiftyHUD: CustomStringConvertible {

    /// Creates a SwiftyHUD with ``HUDStyle/default`` style.
    /// - Parameter progress: A representation of an progress presentation.
    /// - Returns: New instance representation of the SwiftyHUD.
    public static func `default`(progress: Progress) -> Self {
        Self(progress: progress)
    }

    /// A representation of the progress.
    public let progress: Progress

    /// Configuration the appearance of the SwiftyHUD.
    public let style: HUDStyle

    public let description: String

    /// Creates a SwiftyHUD with progress and style representations.
    /// - Parameters:
    ///   - progress: A representation of the progress.
    ///   - style: Configuration the appearance of the SwiftyHUD. Default is ``HUDStyle/default``.
    public init(
        progress: Progress,
        style: HUDStyle = .default
    ) {
        self.progress = progress
        self.style = style
        description = "SwiftyHUD(\(progress))"
    }
}

extension SwiftyHUD {

    /// Adds the specified `hud` to `window` and displays it.
    /// The counterpart of this method is ``hide(in:completion:)``.
    /// - Parameters:
    ///   - hud: A representation of a SwiftyHUD.
    ///   - window: The window that the SwiftyHUD will be added to.
    ///   - animation: The animation type that should be used when the SwiftyHUD is shown and hidden.
    ///   The default animation ``HUDAnimation/default``.
    ///   - duration: Duration of SwiftyHUD display in seconds.
    ///   After this time has elapsed, the SwiftyHUD will be hidden.
    ///   By default `nil`, the SwiftyHUD will not be hidden.
    ///   - completion: Closure called when the showing animation is complete.
    ///   If the `animation` is `nil`, the closure will be called immediately after the showing.
    public static func show(
        _ hud: SwiftyHUD,
        in window: UIView,
        animation: HUDAnimation? = .default,
        duration: TimeInterval? = nil,
        completion: (() -> Void)? = nil
    ) {
        HUDView.showHUD(
            hud,
            in: window,
            animation: animation,
            duration: duration,
            completion: completion
        )
    }

    /// Adds the specified `hud` to first key `UIWindow` and displays it.
    /// The counterpart of this method is ``hide(completion:)``.
    /// - Parameters:
    ///   - hud: A representation of a SwiftyHUD.
    ///   - animation: The animation type that should be used when the SwiftyHUD is shown and hidden.
    ///   The default animation ``HUDAnimation/default``.
    ///   - duration: Duration of SwiftyHUD display in seconds.
    ///   After this time has elapsed, the SwiftyHUD will be hidden.
    ///   By default `nil`, the SwiftyHUD will not be hidden.
    ///   - completion: Closure called when the showing animation is complete.
    ///   If the `animation` is `nil`, the closure will be called immediately after the showing.
    public static func show(
        _ hud: SwiftyHUD,
        animation: HUDAnimation? = .default,
        duration: TimeInterval? = nil,
        completion: (() -> Void)? = nil
    ) {
        HUDView.showHUD(
            hud,
            animation: animation,
            duration: duration,
            completion: completion
        )
    }

    /// Finds the top-most SwiftyHUD subview in `window` that hasn't finished and hides it.
    /// The counterpart to this method is ``show(_:in:animation:duration:completion:)``.
    /// - Parameters:
    ///   - window: The window that is going to be searched for a SwiftyHUD subview.
    ///   - completion: Called after the SwiftyHUD is hidden.
    public static func hide(
        in window: UIView,
        completion: (() -> Void)? = nil
    ) {
        HUDView.hideHUD(
            in: window,
            completion: completion
        )
    }

    /// Finds the top-most SwiftyHUD subview in first key `UIWindow` that hasn't finished and hides it.
    /// The counterpart to this method is ``show(_:animation:duration:completion:)``.
    /// - Parameter completion: Called after the SwiftyHUD is hidden.
    public static func hide(completion: (() -> Void)? = nil) {
        HUDView.hideHUD(completion: completion)
    }
}
