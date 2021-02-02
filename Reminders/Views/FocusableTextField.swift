//
//  FocusableTextField.swift
//  Reminders
//
//  Created by Andrew Morgan on 02/02/2021.
//

import SwiftUI

struct FocusableTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var didBecomeFirstResponder = false

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }

    let title: String
    @Binding var text: String
    @Binding var isFirstResponder: Bool

    init(_ title: String, text: Binding<String>, isFirstResponder: Binding<Bool>) {
        self.title = title
        self._text = text
        self._isFirstResponder = isFirstResponder
    }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = title
        textField.delegate = context.coordinator
        return textField
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<Self>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}
