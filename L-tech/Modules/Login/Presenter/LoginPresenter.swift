//
//  LoginLoginPresenter.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {
    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    
    func didSignIn(success: Bool, error: Error?) {
        if success {
            router.showList()
        } else {
            view.showAlertView(with: error?.localizedDescription ?? "Unkown error", title: "Login error")
        }
    }
    func gotPassword(_ password: String) {
        view.setPassword(password)
    }
    func gotPhoneNumber(_ phoneNumber: String) {
        view.setPhoneNumber(phoneNumber)
    }
    func sighIn(phoneNumber: String, password: String) {        
        interactor.login(phoneNumber: phoneNumber, password: password)
    }
    func viewIsReady() {
        interactor.getPhoneMask {[weak self] (phoneMask) in
            self?.view.gotPhoneMask(phoneMask: phoneMask)
        }
        interactor.getSavedPassword()
        interactor.getSavedPhoneNumber()
    }
}
