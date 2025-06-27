import Foundation

extension SwiftyHUD {
    public static func text(_ message: ProgressMessageFooter,
                            animation: ProgressAnimation? = .default,
                            style: HUDStyle = .default) -> Self {
        Self(progress: .text(message, animation: animation), style: style)
    }
    
    public static func toast(_ message: String, position: HUDStyle.Position, animation: ProgressAnimation? = .default) -> Self {
        Self(progress: .text(.default(text: message)), style: .init(dimmingColor: .clear, position: position))
    }
}
