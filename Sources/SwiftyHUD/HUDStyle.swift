import UIKit

/// The style that will be applied to the appearance of the SwiftyHUD.
public struct HUDStyle: Sendable {
    public struct Position: Sendable {
        public enum Point: Sendable {
            case top, center, bottom
        }

        public static let `default` = Self(point: .center, offset: 0)

        public let point: Point
        public let offset: CGFloat

        public static func top(_ offset: CGFloat) -> Self {
            Self(point: .top, offset: offset)
        }

        public static func center(_ offset: CGFloat) -> Self {
            Self(point: .center, offset: offset)
        }

        public static func bottom(_ offset: CGFloat) -> Self {
            Self(point: .bottom, offset: offset)
        }
    }

    /// Default style.
    ///
    /// Default values:
    /// - ``cornerRadius`` = `10.0`
    /// - ``backgroundColor`` = `.systemGray`
    /// - ``dimmingColor`` =  `UIColor.black.withAlphaComponent(0.2)`
    public static let `default` = Self()

    /// Corner radius for progress view.
    public let cornerRadius: CGFloat

    /// Background color for progress view.
    public let backgroundColor: UIColor

    /// The color of the dimming background of SwiftyHUD.
    public let dimmingColor: UIColor

    public let position: Position

    /// Creates new style.
    /// - Parameters:
    ///   - cornerRadius: Corner radius for progress view. Default is `10.0`.
    ///   - backgroundColor: Background color for progress view. Default is `.systemGray`.
    ///   - dimmingColor: The color of the dimming background of SwiftyHUD.
    ///   Default is `UIColor.black.withAlphaComponent(0.2)`.
    public init(
        cornerRadius: CGFloat = 10.0,
        backgroundColor: UIColor = .systemGray,
        dimmingColor: UIColor = UIColor.black.withAlphaComponent(0.2),
        position: Position = .default
    ) {
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.dimmingColor = dimmingColor
        self.position = position
    }
}
