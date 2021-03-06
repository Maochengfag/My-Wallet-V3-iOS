//
//  Visibility.swift
//  Blockchain
//
//  Created by Alex McGregor on 7/30/18.
//  Copyright © 2018 Blockchain Luxembourg S.A. All rights reserved.
//

/// We used `Visibility` for hiding and showing
/// specific views. It's easier to read
enum Visibility: Int {
    case hidden
    case visible

    var defaultAlpha: CGFloat {
        switch self {
        case .hidden: return 0
        case .visible: return 1
        }
    }
    
    /// Returns the inverted alpha for visibility value
    var invertedAlpha: CGFloat {
        return 1 - defaultAlpha
    }

    var isHidden: Bool {
        return self == .hidden ? true : false
    }
}
