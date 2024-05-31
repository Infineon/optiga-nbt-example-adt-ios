// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation
import InfineonApdu

/// The ``ADTWriteViewModel`` class serves as a ViewModel providing the logic for asynchronous data
/// transfer read operations related to the NBT device. It conforms to the
/// ``NFCSessionManager`` to effectively manage NFC reader sessions to handle ADT read operations
/// for NBT devices.  It can be also observed for changes using the ``ObservableObject``
/// protocol.
/// - SeeAlso: ``NFCSessionManager`` and ``ObservableObject``
class ADTReadViewModel: NFCSessionManager {
    /// A published property that represents the LED status of a asynchronous data transfer (ADT)
    /// operation. It holds a boolean value indicating whether the LED has been set or not.
    ///
    /// - Remark: The ``isLEDOn`` property is marked with the ``@Published`` property wrapper,
    /// allowing it to automatically publish changes to any subscribers. When the value of
    /// ``isLEDOn`` changes, the associated views are updated accordingly.
    ///
    /// - Note: The initial value of ``isLEDOn`` is set to `nil` as status of LED is unknown.
    ///
    /// - SeeAlso: ``@Published``
    @Published public var isLEDOn: Bool?

    /// Asynchronous method responsible for managing communication with the NBT device. This method
    /// is invoked by the ``NFCSessionManager`` once the NFC device is detected, connected, and the
    /// NBT 200 applet is selected to perform asynchronous data transfer (ADT) read operation.
    ///
    /// - Throws: ``AdpuError`` if there is any APDU communication error
    override func initiateNBTDeviceCommunication() async throws {
        // Update the user interface message as configuring LED.
        DispatchQueue.main.async {
            self.message = .messageReadingLedState
            self.tagReaderSession?.alertMessage = self.message
        }
        // Perform the (ADT) read operations. If fails perform the (ADT) read
        // operations it throws the `AdpuError` or other Error
        let isLEDOn = try await adtUseCaseManager?.getStateByAdt()

        // Update the user interface as read LED status.
        DispatchQueue.main.async {
            self.isLEDOn = isLEDOn
            self.message = String(
                format: .messageReadLedState,
                isLEDOn! ? String.titleEnabled : String.titleDisabled
            )
            self.tagReaderSession?.alertMessage = self.message
        }
        // Disconnect the NBT device
        try nbtCommandSet!.disconnect()
    }
}
