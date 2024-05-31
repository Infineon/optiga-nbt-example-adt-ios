// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation

/// An extension of the String type that defines the string constant used in application.
extension String {
    // MARK: - Application level constants

    /// Defines name of the application name.
    static let appName = "NBT Async. Data Transfer"

    /// Defines sub title for application.
    static let subTitleForApp = "OPTIGA\u{2122}\u{00A0}Authenticate\u{00A0}NBT"

    /// Message to check NBT device is personalized.
    static let messageCheckAppletIsPersonalized =
        "Please make sure the OPTIGA™ Authenticate NBT is correctly personalized"

    /// The constant represents the string enabled.
    static let titleEnabled = "enabled"

    /// The constant represents the string disabled.
    static let titleDisabled = "disabled"

    /// The constant represents the LED state is unknown.
    static let titleUnknown = "state unknown"

    /// The title for ``Retry``  button.
    static let buttonTitleRetry = "Retry"

    /// The Empty string.
    /// - Note : There isn't a specific code point to unicode character code for the empty string
    /// (i.e., a string with zero characters).
    static let empty = ""

    /// Message to retry again.
    static let messageRetry = ", please try again"

    /// Message from iOS if NFC interface not ready.
    static let messageSystemResourceNotAvailable = "System resource unavailable"

    /// Message from iOS if NFC interface not ready.
    static let messageNfcNotReady = "NFC interface not ready"

    // MARK: - NBT device use case capabilities screen level constants

    /// The message for user to read to or write from the NFC device .
    static let messageReadWriteNbtDevice =
        "Would you like to read from or write to the OPTIGA\u{2122}\u{00A0}Authenticate\u{00A0}NBT?"

    /// The menu title of the Read form device menu button.
    static let menuTitleReadFromDevice = "Read from device"

    /// The menu title of the write to device menu button.
    static let menuTitleWriteToDevice = "Write to device"

    // MARK: - NBT device ADT write use case level constants

    /// The message for user to click bellow buttons to configure LED status as ON/OFF.
    static let messageToClickButtonToConfigureLED =
        "Please click the buttons below to configure the LED status"

    /// The message for user to inform configuring LED status as ON/OFF.
    static let messageConfiguringLedState = "Configuring LED status as %@"

    /// The message for user to inform configured LED status as ON/OFF..
    static let messageConfiguredLedState = "Configuration successful"

    /// The message for user to tap the NBT device to the iPhone to configure LED status as
    /// ON/OFF.
    static let messageToTabNbtDeviceToConfigureLED =
        "Please tap your iPhone to the OPTIGA\u{2122}\u{00A0}Authenticate\u{00A0}NBT to %@ the LED!"

    /// The title for config LED  buttons.
    static let buttonTitleConfigLED = "%@ LED"

    /// The message for user to press user button to read-out LED state on your PSoC board.
    static let messagePressUserButtonOnPSoc =
        "The ADT read-out on your PSoC\u{2122} board can be triggered by pressing the user button!"

    /// The message represents  is not set message
    static let messageIsNotSet = "is not set"

    // MARK: - NBT device ADT read use case level constants

    /// The message for user to click bellow buttons to read out the current status of the LED.
    static let messageToClickButtonToReadLedState =
        "Please click the button below to read out the current status of the LED"

    /// The message for user to inform reading LED status.
    static let messageReadingLedState = "Reading LED status!"

    /// The message for user to inform reading of configuration successful.
    static let messageReadLedState = "Reading of LED status successful"

    /// The message for user to tap the NBT device to the iPhone to read LED status.
    static let messageToTabNbtDeviceToReadLedState =
        "Please tap your iPhone to the OPTIGA™ Authenticate NBT to read the LED status!"

    /// The message for user to inform LED status.
    static let messageConfigLedState = "LED %@"

    /// The constant represents the string enable.
    static let titleEnable = "Enable"

    /// The constant represents the string disable.
    static let titleDisable = "Disable"

    // MARK: - IFXComponents level constants

    /// The hint for the button.
    static let buttonTitleDefault = "Button"

    /// The hint for the inactive state button.
    static let hintInactiveButton = "Inactive Button"

    /// The hint for the active state button.
    static let hintActiveButton = "Active Button"
}
