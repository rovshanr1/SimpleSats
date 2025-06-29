//
//  UIKitHelpers.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 29.06.25.
//

import UIKit


//MARK: - Hide keyboard extension
extension UIViewController{
    func hideKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension UIViewController {
    func observeKeyboardAdjustments(for scrollView: UIScrollView) {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                scrollView.contentInset.bottom = keyboardFrame.height + 20
                scrollView.verticalScrollIndicatorInsets.bottom = keyboardFrame.height
            }
        }

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { _ in
            scrollView.contentInset.bottom = 0
            scrollView.verticalScrollIndicatorInsets.bottom = 0
        }
    }
}
