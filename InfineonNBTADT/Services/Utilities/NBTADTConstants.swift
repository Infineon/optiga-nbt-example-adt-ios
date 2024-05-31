// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation

/// Stores basic constants for the NBT ADT use case.
public enum NBTADTConstants {
    /// The constant defines the time delay for DispatchQueue to execute task after 3.0 sec
    public static let timeDelay = 3.0

    /// The constant defines the LED On command byte
    public static let ledOn: UInt8 = 0x01

    /// The constant defines the LED Off command byte
    public static let ledOff: UInt8 = 0x00

    /// Instruction byte for the NBT pass through demo application command: setLedByPassthrough .
    public static let insConfigureLed: UInt8 = 0x00

    /// Global constant for proprietary file1 ID
    public static let nbtPP1FileId: UInt16 = 0xE1A1

    /// Length of the expected data (LED state) read from the device
    public static let stateLength: UInt16 = 1
}
