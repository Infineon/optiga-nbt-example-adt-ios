// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view represent ADT read operation screen of mobile phone application for the
/// asynchronous data transfer (ADT) use case of the  NBT devices.
struct ADTReadView: View {
    /// An observed object representing the view model for ``ADTReadView``.  This observed object
    /// property hold ViewModel responsible for asynchronous data transfer (ADT) read operations.
    ///
    /// - SeeAlso: ``ObservableObject``
    @ObservedObject var adtReadViewModel = ADTReadViewModel()

    /// The ``body`` property represents the main content and behaviors of the ``ADTReadView``.
    var body: some View {
        // Define the status of LED for update UI.
        let status = adtReadViewModel.isLEDOn != nil ? adtReadViewModel.isLEDOn! ? String
            .titleEnabled : String.titleDisabled : String.titleUnknown

        ADTOperationUIView(
            subTitle: .subTitleForApp,
            isOperationIconActive: .constant(adtReadViewModel.isLEDOn ?? false),
            operationMessage: adtReadViewModel.message,
            ledStatusMessage: String(format: .messageConfigLedState, status),
            isPSoCVisible: false,
            button1Title: .menuTitleReadFromDevice,
            button1Action: {
                // Start the NFC session with message to read LED status
                adtReadViewModel
                    .startNFCTagReaderSession(
                        withAlertMessage: String(
                            format: .messageToTabNbtDeviceToReadLedState
                        )
                    )
            }
        ).onAppear(perform: {
            // Set message when view appears
            adtReadViewModel.message = .messageToClickButtonToReadLedState
        })
    }
}

/// Provide previews and sample data for the `ADTReadView` during the development process.
#Preview {
    ADTReadView()
}
