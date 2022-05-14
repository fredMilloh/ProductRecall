//
//  ShareSheet.swift
//  ProductRecall
//
//  Created by fred on 22/04/2022.
//

import UIKit
import SwiftUI

/// Inherits the protocol UIViewControllerRepresentable to use UIActivityController in the SwiftUI project
struct ShareSheet: UIViewControllerRepresentable {

    @Binding var activityItems: [Any]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ShareSheet>) {
    }

    class Coordinator: NSObject, UINavigationControllerDelegate {
        var parent: ShareSheet

        init( _ parent: ShareSheet) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
