// SPDX-FileCopyrightText: 2024 Infineon Technologies AG
//
// SPDX-License-Identifier: MIT

import SwiftUI

/// A SwiftUI view represent home screen to select use case operation of mobile phone application
/// for the asynchronous data transfer (ADT) use case of the NBT.
struct HomeView: View {
    /// Access the shared model using @EnvironmentObject
    @EnvironmentObject var appViewModel: AppViewModel

    /// Grid layout with two equally-sized columns, both capable of expanding and contracting based
    /// on the available space.
    let gridLayout = [
        GridItem(.flexible(minimum: .zero, maximum: .infinity)),
        GridItem(.flexible(minimum: .zero, maximum: .infinity))
    ]

    /// The `body` property represents the main content and behaviors of the ``HomeView``.
    var body: some View {
        NavigationView {
            VStack {
                // Header view
                HeaderView(title: .appName, subTitle: .subTitleForApp)

                // Operation message
                Text(verbatim: .messageReadWriteNbtDevice)
                    .font(.body3)
                    .foregroundColor(Color.baseBlack)
                    .padding(.leading)
                    .padding(.trailing)
                    .multilineTextAlignment(.center)
                Spacer()
                LazyVGrid(columns: gridLayout, spacing: StandardPointDimension.largeMargin) {
                    ForEach(appViewModel.actionMenu, id: \.self) { action in
                        NavigationLink(destination: action.destination) {
                            ActionMenuItemView(action: action)
                        }
                    }
                }
                .padding(StandardPointDimension.largePadding)
                Spacer()

                Image(Images.footerBackgroundImage)
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.background)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

/// Provide previews and sample data for the ``HomeView`` during the development process.
#Preview {
    HomeView().environmentObject(mViewModel)
}
