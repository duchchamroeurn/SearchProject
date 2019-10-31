//
//  AuthVC.swift
//  SearchProject
//
//  Created by DUCH Chamroeun on 10/31/19.
//  Copyright © 2019 DUCH Chamroeurn. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    @IBOutlet weak var btnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    private let noti = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfEmail.delegate = self
        //tfEmail.becomeFirstResponder()
        tfPwd.delegate = self
        //tfPwd.becomeFirstResponder()
        
        noti.addObserver(self, selector: #selector(keyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        noti.addObserver(self, selector: #selector(hideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight : Int = Int(keyboardSize.height)
            print("Keyboard Height = ", keyboardHeight)
            btnBottomConstraint.constant = CGFloat(keyboardHeight)
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func hideKeyboard(_ notification: NSNotification) {
        btnBottomConstraint.constant = 8.0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        
        Switcher.share.switchScreen()
    }

}


extension AuthVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
