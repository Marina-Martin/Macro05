//
//  TextFieldDelegate.swift
//  Treat
//
//  Created by Marina Martin on 28/05/24.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
