// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A model class representing an action menu information such as ID, title, icon, state, etc.
struct ActionMenu: Hashable {
    /// The unique identifier of the action menu item.
    var id: UUID

    /// The title of the action menu item.
    let title: String

    /// The icon associated with the action menu item.
    let icon: String

    /// The destination view associated with the action menu item.
    var destination: AnyView

    /// The destination view associated with the action menu item.
    var isActive: Bool

    /// Initializes a new action menu item.
    ///
    /// - Parameters:
    ///   - title: The title of the action menu item.
    ///   - icon: The icon associated with the action menu item.
    ///   - destination: The destination view associated with the action menu item.
    init(title: String, icon: String, destination: AnyView, isActive: Bool) {
        id = UUID()
        self.title = title
        self.icon = icon
        self.destination = destination
        self.isActive = isActive
    }

    /// Implements the `hash(into:)` method required by the ``Hashable`` protocol.
    ///
    /// - Parameter hasher: The hasher used to combine the properties of the action menu item.
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    /// Implements the equality operator (`==`) required by the `Hashable` protocol.
    ///
    /// - Parameters:
    ///  - lhs: The left-hand side ``ActionMenu`` instance.
    ///  - rhs: The right-hand side ``ActionMenu`` instance.
    ///
    /// - Returns: `true` if the `id` properties of both instances are equal, `false` otherwise.
    static func == (lhs: ActionMenu, rhs: ActionMenu) -> Bool {
        lhs.id == rhs.id
    }
}
