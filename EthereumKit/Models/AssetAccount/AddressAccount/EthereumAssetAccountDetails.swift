//
//  EthereumAssetAccountDetails.swift
//  EthereumKit
//
//  Created by Jack on 19/03/2019.
//  Copyright © 2019 Blockchain Luxembourg S.A. All rights reserved.
//

import Foundation
import PlatformKit

public struct EthereumAssetAccountDetails: AssetAccountDetails, Equatable {
    public typealias Account = EthereumAssetAccount
    
    public var account: Account
    public var balance: CryptoValue
    public var nonce: UInt64
    
    public init(account: Account, balance: CryptoValue, nonce: UInt64) {
        self.account = account
        self.balance = balance
        self.nonce = nonce
    }
}
