//
//  Web3+Concurrency.swift
//  Web3
//
//  Created by Jianrong Fan on 2024/8/13.
//

import Foundation
import Web3

public extension Web3 {

    func clientVersion() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            self.clientVersion { response in
                switch response.status {
                case .success(let version):
                    continuation.resume(returning: version)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

public extension Web3.Net {

    func version() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            self.version { response in
                switch response.status {
                case .success(let version):
                    continuation.resume(returning: version)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func peerCount() async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.peerCount { response in
                switch response.status {
                case .success(let count):
                    continuation.resume(returning: count)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

public extension Web3.Eth {
    
    func protocolVersion() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            self.protocolVersion { response in
                switch response.status {
                case .success(let version):
                    continuation.resume(returning: version)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func syncing() async throws -> EthereumSyncStatusObject {
        return try await withCheckedThrowingContinuation { continuation in
            self.syncing { response in
                switch response.status {
                case .success(let syncStatus):
                    continuation.resume(returning: syncStatus)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func mining() async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            self.mining { response in
                switch response.status {
                case .success(let isMining):
                    continuation.resume(returning: isMining)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func hashrate() async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.hashrate { response in
                switch response.status {
                case .success(let rate):
                    continuation.resume(returning: rate)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func gasPrice() async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.gasPrice { response in
                switch response.status {
                case .success(let price):
                    continuation.resume(returning: price)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func accounts() async throws -> [EthereumAddress] {
        return try await withCheckedThrowingContinuation { continuation in
            self.accounts { response in
                switch response.status {
                case .success(let addresses):
                    continuation.resume(returning: addresses)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func blockNumber() async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.blockNumber { response in
                switch response.status {
                case .success(let number):
                    continuation.resume(returning: number)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getBalance(address: EthereumAddress, block: EthereumQuantityTag) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.getBalance(address: address, block: block) { response in
                switch response.status {
                case .success(let balance):
                    continuation.resume(returning: balance)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getStorageAt(
        address: EthereumAddress,
        position: EthereumQuantity,
        block: EthereumQuantityTag
    ) async throws -> EthereumData {
        return try await withCheckedThrowingContinuation { continuation in
            self.getStorageAt(address: address, position: position, block: block) { response in
                switch response.status {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getTransactionCount(address: EthereumAddress, block: EthereumQuantityTag) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.getTransactionCount(address: address, block: block) { response in
                switch response.status {
                case .success(let count):
                    continuation.resume(returning: count)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getBlockTransactionCountByHash(blockHash: EthereumData) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.getBlockTransactionCountByHash(blockHash: blockHash) { response in
                switch response.status {
                case .success(let count):
                    continuation.resume(returning: count)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getBlockTransactionCountByNumber(block: EthereumQuantityTag) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.getBlockTransactionCountByNumber(block: block) { response in
                switch response.status {
                case .success(let count):
                    continuation.resume(returning: count)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getUncleCountByBlockHash(blockHash: EthereumData) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.getUncleCountByBlockHash(blockHash: blockHash) { response in
                switch response.status {
                case .success(let count):
                    continuation.resume(returning: count)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getUncleCountByBlockNumber(block: EthereumQuantityTag) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.getUncleCountByBlockNumber(block: block) { response in
                switch response.status {
                case .success(let count):
                    continuation.resume(returning: count)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getCode(address: EthereumAddress, block: EthereumQuantityTag) async throws -> EthereumData {
        return try await withCheckedThrowingContinuation { continuation in
            self.getCode(address: address, block: block) { response in
                switch response.status {
                case .success(let code):
                    continuation.resume(returning: code)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func sendRawTransaction(transaction: EthereumSignedTransaction) async throws -> EthereumData {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                try self.sendRawTransaction(transaction: transaction) { response in
                    switch response.status {
                    case .success(let data):
                        continuation.resume(returning: data)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }

    func sendTransaction(transaction: EthereumTransaction) async throws -> EthereumData {
        return try await withCheckedThrowingContinuation { continuation in
            self.sendTransaction(transaction: transaction) { response in
                switch response.status {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func call(call: EthereumCall, block: EthereumQuantityTag) async throws -> EthereumData {
        return try await withCheckedThrowingContinuation { continuation in
            self.call(call: call, block: block) { response in
                switch response.status {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func estimateGas(call: EthereumCall) async throws -> EthereumQuantity {
        return try await withCheckedThrowingContinuation { continuation in
            self.estimateGas(call: call) { response in
                switch response.status {
                case .success(let quantity):
                    continuation.resume(returning: quantity)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getBlockByHash(blockHash: EthereumData, fullTransactionObjects: Bool) async throws -> EthereumBlockObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getBlockByHash(blockHash: blockHash, fullTransactionObjects: fullTransactionObjects) { response in
                switch response.status {
                case .success(let blockObject):
                    continuation.resume(returning: blockObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getBlockByNumber(
        block: EthereumQuantityTag,
        fullTransactionObjects: Bool
    ) async throws -> EthereumBlockObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getBlockByNumber(block: block, fullTransactionObjects: fullTransactionObjects) { response in
                switch response.status {
                case .success(let blockObject):
                    continuation.resume(returning: blockObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getTransactionByHash(blockHash: EthereumData) async throws -> EthereumTransactionObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getTransactionByHash(blockHash: blockHash) { response in
                switch response.status {
                case .success(let transactionObject):
                    continuation.resume(returning: transactionObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getTransactionByBlockHashAndIndex(
        blockHash: EthereumData,
        transactionIndex: EthereumQuantity
    ) async throws -> EthereumTransactionObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getTransactionByBlockHashAndIndex(blockHash: blockHash, transactionIndex: transactionIndex) { response in
                switch response.status {
                case .success(let transactionObject):
                    continuation.resume(returning: transactionObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getTransactionByBlockNumberAndIndex(
        block: EthereumQuantityTag,
        transactionIndex: EthereumQuantity
    ) async throws -> EthereumTransactionObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getTransactionByBlockNumberAndIndex(block: block, transactionIndex: transactionIndex) { response in
                switch response.status {
                case .success(let transactionObject):
                    continuation.resume(returning: transactionObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getTransactionReceipt(transactionHash: EthereumData) async throws -> EthereumTransactionReceiptObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getTransactionReceipt(transactionHash: transactionHash) { response in
                switch response.status {
                case .success(let receiptObject):
                    continuation.resume(returning: receiptObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getUncleByBlockHashAndIndex(
        blockHash: EthereumData,
        uncleIndex: EthereumQuantity
    ) async throws -> EthereumBlockObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getUncleByBlockHashAndIndex(blockHash: blockHash, uncleIndex: uncleIndex) { response in
                switch response.status {
                case .success(let blockObject):
                    continuation.resume(returning: blockObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getUncleByBlockNumberAndIndex(
        block: EthereumQuantityTag,
        uncleIndex: EthereumQuantity
    ) async throws -> EthereumBlockObject? {
        return try await withCheckedThrowingContinuation { continuation in
            self.getUncleByBlockNumberAndIndex(block: block, uncleIndex: uncleIndex) { response in
                switch response.status {
                case .success(let blockObject):
                    continuation.resume(returning: blockObject)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    func getLogs(
        addresses: [EthereumAddress]?,
        topics: [[EthereumData]]?,
        fromBlock: EthereumQuantityTag,
        toBlock: EthereumQuantityTag
    ) async throws -> [EthereumLogObject] {
        return try await withCheckedThrowingContinuation { continuation in
            self.getLogs(addresses: addresses, topics: topics, fromBlock: fromBlock, toBlock: toBlock) { response in
                switch response.status {
                case .success(let logObjects):
                    continuation.resume(returning: logObjects)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
