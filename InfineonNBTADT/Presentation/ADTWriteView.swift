// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view represent ADT write operation screen of mobile phone application for the
/// asynchronous data transfer (ADT) use case of the  NBT.
struct ADTWriteView: View {
    /// An observed object representing the view model for ``ADTWriteView``.  This observed object
    /// property hold ViewModel responsible for asynchronous data transfer (ADT) write operations.
    ///
    /// - SeeAlso: ``ObservableObject``
    @ObservedObject var adtWriteViewModel = ADTWriteViewModel()

    /// The ``body`` property represents the main content and behaviors of the ``ADTWriteView``.
    var body: some View {
        // Define the status of LED for update UI.
        let msg = adtWriteViewModel.isLEDOn != nil ? adtWriteViewModel.isLEDOn! ? String
            .titleEnabled : String.titleDisabled : String.messageIsNotSet

        ADTOperationUIView(
            subTitle: .subTitleForApp,
            isOperationIconActive: .constant(adtWriteViewModel.isLEDOn ?? false),
            operationMessage: adtWriteViewModel.message,
            ledStatusMessage: String(format: .messageConfigLedState, msg),
            isPSoCVisible: true,
            button1Title: String(format: .buttonTitleConfigLED, String.titleEnable),
            button2Title: String(format: .buttonTitleConfigLED, String.titleDisable),
            button1Action: {
                // Start the NFC session with message to turn on LED
                adtWriteViewModel.ledStatus = true
                adtWriteViewModel.startNFCTagReaderSession(withAlertMessage: String(
                    format: .messageToTabNbtDeviceToConfigureLED,
                    String.titleEnable.lowercased()
                ))

            },
            button2Action: {
                // Start the NFC session with message to turn off LED
                adtWriteViewModel.ledStatus = false
                adtWriteViewModel.startNFCTagReaderSession(withAlertMessage: String(
                    format: .messageToTabNbtDeviceToConfigureLED,
                    String.titleDisable.lowercased()
                ))
            }
        ).onAppear(perform: {
            // Set message when view appears
            adtWriteViewModel.message = .messageToClickButtonToConfigureLED
        })
    }
}

/// Provide previews and sample data for the `ADTWriteView` during the development process.
#Preview {
    ADTWriteView()
}
