// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import Foundation
import SwiftUI

/// The ``AppViewModel`` class serves as a ViewModel providing the  ADT application level logic
/// related to the NBT device. It conforms to the ``ObservableObject`` to effectively manage
/// UI components across application. It can be also observed for changes using the
/// ``ObservableObject``  protocol.
///
/// - SeeAlso: ``ObservableObject``
class AppViewModel: ObservableObject {
    /// Flag to control UI updation when app state changes
    var isUpdateMenuState: Bool = true

    ///  List of action menu on view screen.
    @Published var actionMenu = [
        ActionMenu(
            title: .menuTitleReadFromDevice,
            icon: Images.adtReadIcon,
            destination: AnyView(ADTReadView()),
            isActive: true
        ),
        ActionMenu(
            title: .menuTitleWriteToDevice,
            icon: Images.adtWriteIcon,
            destination: AnyView(ADTWriteView()),
            isActive: true
        )
    ]
}

/// Define the global object access using @EnvironmentObject.
let mViewModel = AppViewModel()
