//
//  NVMKeychainError.swift
//
//
//  Created by Damian Van de Kauter on 02/03/2024.
//

import Foundation

public enum NVMKeychainError: Error {
    case retrieveFailed(NVMKeychainRetrieveError)
    case storeFailed(NVMKeychainStoreError)
    case updateFailed(NVMKeychainUpdateError)
    
    case notFound
    case keychainDisabled
    
    case invalidBundleID(String?)
    case invalidKeychainType
    case invalidPasswordData
    case tagFailed
}

extension NVMKeychainError: LocalizedError {
    var errorCode: Int {
        switch self {
        case .retrieveFailed:
            return 1
        case .storeFailed:
            return 2
        case .updateFailed:
            return 3
            
        case .notFound:
            return 4
        case .keychainDisabled:
            return 5
            
        case .invalidBundleID:
            return 6
        case .invalidKeychainType:
            return 7
        case .invalidPasswordData:
            return 8
        case .tagFailed:
            return 9
        }
    }
    
    public var errorDescription: String? {
        switch self {
        case .retrieveFailed(let nvmKeychainRetrieveError):
            return nvmKeychainRetrieveError.localizedDescription
        case .storeFailed(let nvmKeychainStoreError):
            return nvmKeychainStoreError.localizedDescription
        case .updateFailed(let nvmKeychainUpdateError):
            return nvmKeychainUpdateError.localizedDescription
            
        case .notFound:
            return String(localized: "Item not found in the keychain.")
        case .keychainDisabled:
            return String(localized: "Keychain is disabled. Your device probably does not have a passcode.")
            
        case .invalidBundleID(let bundleID):
            return String(localized: "The Bundle ID \"\(bundleID ?? "")\" is not a valid Bundle Identifier.")
        case .invalidKeychainType:
            return String(localized: "Unable to get a correct Keychain Type.")
        case .invalidPasswordData:
            return String(localized: "Unable to get data from the Password.")
        case .tagFailed:
            return String(localized: "Unable to create the tag.")
        }
    }
}
