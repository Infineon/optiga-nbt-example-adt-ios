// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view reusable component representing an action menu item view.
///
///  This component displays an icon, a title, and optional additional content within a VStack.
///  - Parameters:
///   - action: The ``ActionMenu`` instance representing the action menu item.
struct ActionMenuItemView: View {
    /// Instance of action menu item use to hold the name and title with state of menu etc.
    /// information.
    let action: ActionMenu

    /// The `body` property represents the main content and behaviors of the ``ActionMenuItemView``.
    var body: some View {
        VStack(spacing: 10) {
            Image(action.icon)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: StandardPointDimension.smallImageSize,
                    height: StandardPointDimension.smallImageSize
                )
                .foregroundColor(action.isActive ? Color.ocean500 : Color.gray)

            Text(action.title)
                .font(.body3)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.baseBlack)
        }
        .padding(StandardPointDimension.largePadding)
    }
}

/// Provide previews and sample data for the `ActionMenuItemView` during the development process.
#Preview {
    HStack {
        ActionMenuItemView(action: ActionMenu(
            title: .hintInactiveButton,
            icon: Images.adtReadIcon,
            destination: AnyView(Text(verbatim: .empty)),
            isActive: false
        ))
        ActionMenuItemView(action: ActionMenu(
            title: .hintActiveButton,
            icon: Images.adtWriteIcon,
            destination: AnyView(Text(verbatim: .empty)),
            isActive: true
        ))
    }
}
