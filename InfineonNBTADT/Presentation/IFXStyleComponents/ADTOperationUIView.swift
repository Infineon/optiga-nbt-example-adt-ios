// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view to the used for different ADT operation use case.
struct ADTOperationUIView: View {
    /// Access the shared model using @EnvironmentObject.
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    /// Represents the title displayed in the user interface.
    public var title: String = .appName

    /// Represents the title displayed in the user interface.
    public var subTitle: String = .subTitleForApp

    /// Indicates whether a icon or image used in the user interface is active/inactive.
    @Binding public var isOperationIconActive: Bool

    /// Represents a message associated with a specific operation to be perform.
    public var operationMessage: String

    /// Represents a message associated with a specific LED status.
    public var ledStatusMessage: String

    /// Indicates whether a User input specific UI element is visible or hidden.
    public var isPSoCVisible: Bool

    /// Represents a title for button default is set to Retry.
    public var button1Title: String = .buttonTitleDefault

    /// Represents a title for button default is set to Retry.
    public var button2Title: String = .buttonTitleDefault

    /// Optional holder for call back action.
    public var button1Action: (() -> Void)?

    /// Optional holder for call back action.
    public var button2Action: (() -> Void)?

    var body: some View {
        VStack {
            // Header view
            HeaderView(title: title, subTitle: subTitle)

            // Operation message
            Text(verbatim: operationMessage)
                .font(.body3)
                .foregroundColor(Color.baseBlack)
                .padding(.leading)
                .padding(.trailing)
                .multilineTextAlignment(.center)
            Spacer()
            Image(Images.lightIcon)
                .resizable()
                .renderingMode(.template)
                .frame(
                    width: StandardPointDimension.operationImageSize,
                    height: StandardPointDimension.operationImageSize
                )
                .foregroundColor(isOperationIconActive ? Color.ocean500 : Color.gray)
            Text(verbatim: ledStatusMessage)
                .font(.body3)
                .foregroundColor(Color.baseBlack)
                .padding(.leading)
                .padding(.trailing)
                .multilineTextAlignment(.center)

            Spacer()
            HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/) {
                if let callback = button1Action {
                    IFXButton(title: button1Title, action: callback)
                }

                if let callback = button2Action {
                    IFXButton(title: button2Title, action: callback)
                }
            }
            Spacer()
            if isPSoCVisible {
                Text(verbatim: .messagePressUserButtonOnPSoc)
                    .font(.body4)
                    .foregroundColor(Color.baseBlack)
                    .padding(.leading)
                    .padding(.trailing)
                    .multilineTextAlignment(.center)

                Image(Images.pSocNoteImage)
                    .resizable()
                    .frame(
                        width: StandardPointDimension.pSocImageViewWidth,
                        height: StandardPointDimension.pSocImageViewHeight
                    )
                    .foregroundColor(Color.gray)
                Spacer()
                // Back or Cancel button
            }

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(Images.closeIcon)
                    .resizable()
                    .frame(
                        width: StandardPointDimension.smallImageSize,
                        height: StandardPointDimension.smallImageSize
                    )
                    .foregroundColor(Color.ocean500)
            })
            Spacer()
        }
        .background(Color.background)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

/// Provide previews and sample data for the ``AdtOperationUIView`` during the development process.
#Preview {
    ADTOperationUIView(
        isOperationIconActive: .constant(true),
        operationMessage: .messageToTabNbtDeviceToConfigureLED,
        ledStatusMessage: .messageConfigLedState,
        isPSoCVisible: true,
        button1Action: {}
    )
}
