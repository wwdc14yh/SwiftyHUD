import Foundation

extension SwiftyHUD {
    public static func text(_ message: ProgressMessageFooter,
                            animation: ProgressAnimation? = .default,
                            style: HUDStyle = .default) -> Self {
        Self(progress: .text(message, animation: animation), style: style)
    }
}
