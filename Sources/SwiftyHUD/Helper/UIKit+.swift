//
//  File.swift
//  SwiftyHUD
//
//  Created by y H on 2024/11/1.
//

import UIKit

extension CGSize {
    init(equilateral side: CGFloat) {
        self.init(width: side, height: side)
    }

    func outset(by insets: UIEdgeInsets) -> Self {
        Self(width: width + insets.horizontal,
             height: height + insets.vertical)
    }
}

extension UIEdgeInsets {
    var horizontal: CGFloat {
        left + right
    }

    var vertical: CGFloat {
        top + bottom
    }

    init(equilateral side: CGFloat) {
        self.init(top: side, left: side, bottom: side, right: side)
    }
}

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        connectedScenes
            .lazy
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
