import Foundation

extension Progress {
    public static func text(_ message: ProgressMessageFooter,
                            animation: ProgressAnimation? = .default) -> Self {
        Self.init(header: ProgressEmptyHeader.default, indicator: ProgressEmptyIndicator.default, footer: message, animation: animation)
    }
}
