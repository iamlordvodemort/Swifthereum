//
//  NetworkID.swift
//  Swifthereum
//
//  Created by Ronald Mannak on 10/19/17.
//

import Foundation
import BigInt

public typealias NetworkIDValue = BigInt

public enum NetworkID  {
    case olympic                // Ethereum prerelease Testnet (OBSOLETE)
    case main                   // Ethereum Main Net (Frontier, Homestead, Metropolis, Serenity)
    case morden                 // Ethereum Morden Testnet (OBSOLETE)
    case ropsten                // Ethereum Ropsten Testnet (OBSOLETE)
    case rinkeby                // Ethereum Rinkeby Testnet
    case kovan                  // Ethereum Kovan open parity testnet
    case custom(NetworkIDValue) // Any custom network ID
    
    /// id of the network in BigInt format
    public var id: NetworkIDValue {
        switch self {
        case .olympic:          return 0
        case .main:             return 1
        case .morden:           return 2
        case .ropsten:          return 3
        case .rinkeby:          return 4
        case .kovan:            return 42
        case .custom(let id):   return id
        }
    }
    
    init(networkID: BigInt) {
        
        switch networkID {
        case 0:                 self = .olympic
        case 1:                 self = .main
        case 2:                 self = .morden
        case 3:                 self = .ropsten
        case 4:                 self = .rinkeby
        case 42:                self = .kovan
        default:                self = .custom(networkID)
        }
    }
}