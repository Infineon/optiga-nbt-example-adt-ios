// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation
import InfineonApduNbt

/// The `ADTUseCaseManager` class serves as a manager for asynchronous data transfer (ADT) use case
/// operations supported by NBT device by providing the API specific to ADT operations .
public class ADTUseCaseManager {
    /// A property holder for the ``NbtCommandSet`` which provides the API supported by the NBT
    /// device application.
    ///
    /// - SeeAlso: ``NbtCommandSet``
    private var nbtCommandSet: NbtCommandSet

    /// Initializes a instance of the ``ADTUseCaseManager`` class.
    ///
    /// - Parameters:
    ///  - ptDemoCommandSet: A ``NbtCommandSet`` object. it represents the command set to be used by
    /// the ``ADTUseCaseManager`` instance to perform APDU communication.
    init(nbtCommandSet: NbtCommandSet) {
        self.nbtCommandSet = nbtCommandSet
    }

    /// Async method to connect to the NBT device.
    ///
    /// - Throws An ``APDUError``: if connecting to NBT fails.
    public func connect() async throws {
        _ = try await nbtCommandSet.connect(data: nil)
    }

    /// Method to disconnect from NFC device.
    ///
    /// - Throws Error if disconnecting from NFC device fails.
    public func disconnect() throws {
        try nbtCommandSet.disconnect()
    }

    /// Method to disconnect from NBT device.
    ///
    /// - Returns: Returns the response with status word.
    ///
    /// - Throws An ``APDUError``: if selecting NBT device application fails.
    public func selectApplication() async throws -> NbtApduResponse {
        try await nbtCommandSet.selectApplication()
    }

    /// Method to set the state of the LED (on or off) with asynchronous data transfer (ADT)
    /// operations.
    ///
    /// - Parameter state:  LED state on if true else off
    ///
    /// - Throws An ``APDUError`` if APDU communication with NBT device fails.
    public func setStateByAdt(state: Bool) async throws {
        // Initialize APDU parameter according LED state
        let stateByte = Data([state ? NBTADTConstants.ledOn : NBTADTConstants.ledOff])

        // select Application on NBT device
        _ = try await nbtCommandSet.selectApplication().checkOK()

        // select PP1 file on NBT device
        _ = try await nbtCommandSet.selectFile(fileId: NBTADTConstants.nbtPP1FileId).checkOK()

        // Update PP1 file binary data on NBT device to set LED state.
        _ = try await nbtCommandSet.updateBinary(
            offset: NbtConstants.offsetFileStart,
            data: stateByte
        ).checkOK()
    }

    /// Method to reads the state of the LED (on or off) with asynchronous data transfer (ADT)
    /// reads operations. where this function reads data from PP File2 of the NBT sample using ADT
    /// APDU
    /// commands and returns the current state of the  device
    ///
    /// - Returns LED state ( On  as true or Off as false)
    ///
    /// - Throws  Error by command set of APDU library
    public func getStateByAdt() async throws -> Bool {
        // Initialize APDU parameter according LED state
        _ = try await nbtCommandSet.selectApplication().checkOK()
        // select Application on NBT device
        _ = try await nbtCommandSet.selectFile(fileId: NBTADTConstants.nbtPP1FileId).checkOK()

        // Read PP1 file binary data on NBT device to get LED state.
        let apduResponse = try await nbtCommandSet.readBinary(
            offset: NbtConstants.offsetFileStart,
            expectedLen: NBTADTConstants.stateLength
        ).checkOK()

        // Parsing the LED state and return state.
        let response = apduResponse.getData()
        return response?[.zero] != NBTADTConstants.ledOff
    }
}
