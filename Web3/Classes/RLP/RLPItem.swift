//
//  RLPItem.swift
//  Web3
//
//  Created by Koray Koska on 01.02.18.
//

import Foundation
import VaporBytes
import BigInt

/**
 * An RLP encodable item. Either a byte array or a list of RLP items.
 *
 * More formally:
 *
 * ```
 * G = Bytes | L
 * L = [] | [G]
 * ```
 *
 * Be careful. The maximum safe size of the bytes array is 2GiB (2^31/2^30)
 * as the max allowed elements in an array is 2^31 (for 32 bit systems).
 */
public struct RLPItem {

    /// The internal type of this value
    public let valueType: ValueType

    public enum ValueType {

        /// A bytes value
        case bytes(Bytes)

        /// An array value
        case array([RLPItem])
    }

    public init(valueType: ValueType) {
        self.valueType = valueType
    }
}

// MARK: - Convenient Initializers

public extension RLPItem {

    public static func bytes(_ bytes: Bytes) -> RLPItem {
        return RLPItem(bytes: bytes)
    }

    public static func bytes(_ bytes: Byte...) -> RLPItem {
        return RLPItem(bytes: bytes)
    }

    public init(bytes: Bytes) {
        self.init(valueType: .bytes(bytes))
    }
}

extension RLPItem: ExpressibleByStringLiteral {

    public static func string(_ string: String) -> RLPItem {
        return RLPItem(stringLiteral: string)
    }

    public typealias StringLiteralType = String

    public init(stringLiteral value: String) {
        self.init(valueType: .bytes(value.makeBytes()))
    }
}

extension RLPItem: ExpressibleByIntegerLiteral {

    public static func bigUInt(_ uint: BigUInt) -> RLPItem {
        return self.init(valueType: .bytes(uint.makeBytes().trimLeadingZeros()))
    }

    public static func uint(_ uint: UInt) -> RLPItem {
        return RLPItem(integerLiteral: uint)
    }

    public typealias IntegerLiteralType = UInt

    public init(integerLiteral value: UInt) {
        self.init(valueType: .bytes(value.makeBytes().trimLeadingZeros()))
    }
}

extension RLPItem: ExpressibleByArrayLiteral {

    public static func array(_ array: [RLPItem]) -> RLPItem {
        return self.init(valueType: .array(array))
    }

    public static func array(_ array: RLPItem...) -> RLPItem {
        return self.init(valueType: .array(array))
    }

    public typealias ArrayLiteralElement = RLPItem

    public init(arrayLiteral elements: RLPItem...) {
        self.init(valueType: .array(elements))
    }
}

// MARK: - Convenient Getters

public extension RLPItem {

    /**
     * Returns an array of bytes iff `self.valueType` is .bytes. Returns nil otherwise.
     */
    public var bytes: Bytes? {
        guard case .bytes(let value) = valueType else {
            return nil
        }
        return value
    }

    /**
     * Returns the string representation of this item iff `self.valueType` is .bytes. Returns nil otherwise.
     */
    public var string: String? {
        guard case .bytes(let value) = valueType else {
            return nil
        }
        return value.makeString()
    }

    /**
     * Returns the uint representation of this item (big endian represented) iff `self.valueType` is .bytes.
     * Returns nil otherwise.
     */
    public var uint: UInt? {
        guard case .bytes(let value) = valueType else {
            return nil
        }
        return value.bigEndianUInt
    }

    /**
     * Returns the `BigUInt` representation of this item (big endian represented) iff `self.valueType` is .bytes.
     * Returns nil otherwise.
     */
    public var bigUInt: BigUInt? {
        guard case .bytes(let value) = valueType else {
            return nil
        }
        return BigUInt(bytes: value)
    }

    /**
     * Returns an array of `RLPItem`'s iff `self.valueType` is .array. Returns nil otherwise.
     */
    public var array: [RLPItem]? {
        guard case .array(let elements) = valueType else {
            return nil
        }
        return elements
    }
}

// MARK: - CustomStringConvertible

extension RLPItem: CustomStringConvertible {

    public var description: String {
        var str = ""
        switch valueType {
        case .bytes(let bytes):
            str = bytes.map({ "0x\(String($0, radix: 16))" }).description
        case .array(let array):
            /*
             str = "["
             for el in array {
             str += "\n"
             str += el.description
             str += ", "
             }
             if array.count > 0 {
             str += "\n"
             }
             str += "]"
             */
            str = array.description
        }

        return str
    }
}
