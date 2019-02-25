//
//  LoginLoginViewController.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit
import AKMaskField

class LoginViewController: UIViewController, LoginViewInput {
    
    // MARK: - Identifiers
    let selfToListSegue = "selfToListSegue"
    
    // MARK: - IBOutlet
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var phoneNumberTextField: AKMaskField!
    
    // MARK: - Public properties
    var phoneMaskViewModel: PhoneMaskViewModel!
    var output: LoginViewOutput!
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField?.maskTemplate = "_"
        phoneNumberTextField.delegate = self
        output.viewIsReady()
    }
    
    // MARK: - IBAction
    @IBAction func signInTouchUpInside(_ sender: UIButton) {
        guard let phoneNumber = phoneNumberTextField.text, let password = passwordTextField.text else {
            return
        }
        output.sighIn(phoneNumber: phoneNumber, password: password)
    }
    
    // MARK: - Public methods
    func gotPhoneMask(phoneMask: PhoneMaskViewModel) {
        phoneMaskViewModel = phoneMask
        if phoneNumberTextField.text?.isEmpty ?? true {
            phoneNumberTextField?.setMask(phoneMask.mask, withMaskTemplate: phoneMask.template)
        }
    }
    func showAlertView(with text: String, title: String = "") {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func setPassword(_ password: String) {
        DispatchQueue.main.async {
            self.passwordTextField?.text = password
        }
    }
    func setPhoneNumber(_ phoneNumber: String) {
        DispatchQueue.main.async {
            self.phoneNumberTextField?.text = phoneNumber
        }
    }
    
    // MARK: LoginViewInput
    func setupInitialState() {
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberTextField {
            phoneNumberTextField?.setMask(phoneMaskViewModel.mask, withMaskTemplate: phoneMaskViewModel.template)
        }
        return true
    }
}
