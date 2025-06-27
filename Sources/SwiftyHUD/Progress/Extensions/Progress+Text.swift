import UIKit

extension Progress {
    public static func text(_ message: ProgressMessageFooter,
                            animation: ProgressAnimation? = .default) -> Self {
        let message = ProgressMessageFooter(text: message.text, font: message.font, color: message.color, alignment: message.alignment, insets: UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20))
        return Self.init(header: ProgressEmptyHeader.default, indicator: ProgressEmptyIndicator.default, footer: message, animation: animation)
    }
}
