//
//  Contract+Concurrency.swift
//  Web3
//
//  Created by Jianrong Fan on 2024/8/13.
//

import Foundation
import Collections
#if !Web3CocoaPods
    import Web3
#endif

public extension SolidityInvocation {

    func call(block: EthereumQuantityTag = .latest) async throws -> [String: Any] {
        return try await withCheckedThrowingContinuation { continuation in
            self.call(block: block) { result, error  in
                if let result {
                    continuation.resume(returning: result)
                } else {
                    continuation.resume(throwing: error ?? fatalError())
                }
            }
        }
    }

    func send(
        nonce: EthereumQuantity? = nil,
        gasPrice: EthereumQuantity? = nil,
        maxFeePerGas: EthereumQuantity? = nil,
        maxPriorityFeePerGas: EthereumQuantity? = nil,
        gasLimit: EthereumQuantity? = nil,
        from: EthereumAddress,
        value: EthereumQuantity? = nil,
        accessList: OrderedDictionary<EthereumAddress, [EthereumData]> = [:],
        transactionType: EthereumTransaction.TransactionType = .legacy
    ) async throws -> EthereumData {
        return try await withCheckedThrowingContinuation { continuation in
            self.send(
                nonce: nonce,
                gasPrice: gasPrice,
                maxFeePerGas: maxFeePerGas,
                maxPriorityFeePerGas: maxPriorityFeePerGas,
                gasLimit: gasLimit,
                from: from,
                value: value,
                accessList: accessList,
                transactionType: transactionType
            ) { result, error in
                if let result {
                    continuation.resume(returning: result)
                } else {
                    continuation.resume(throwing: error ?? fatalError())
                }
            }
        }
    }

    func estimateGas(
        from: EthereumAddress? = nil,
        gas: EthereumQuantity? = nil,
        value: EthereumQuantity? = nil
    ) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.estimateGas(from: from, gas: gas, value: value) { result, error in
                if let result {
                    continuation.resume(returning: result)
                } else {
                    continuation.resume(throwing: error ?? fatalError())
                }
            }
        }
    }
}
