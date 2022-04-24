//
//  ShareSheet.swift
//  ProductRecall
//
//  Created by fred on 22/04/2022.
//

import UIKit
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
        
    @Binding var activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
//    class Coordinator: NSObject, UINavigationControllerDelegate {
//
//        var parent: ShareSheet
//
//        init( _ parent: ShareSheet) {
//            self.parent = parent
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
}

