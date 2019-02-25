//
//  LoginLoginInteractor.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import Foundation

class LoginInteractor: LoginInteractorInput {
    
    var loginDataProvider: LoginDataProvider!
    weak var output: LoginInteractorOutput!
    var keyChainService: KeychainService!
    
    func savePhoneNumber(_ phoneNumber: String) {
        _ = keyChainService.save(value: phoneNumber, key: KeychainService.Keys.phoneNumber.rawValue)
    }
    func savePassword(_ password: String) {
        _ = keyChainService.save(value: password, key: KeychainService.Keys.password.rawValue)
    }
    func getSavedPhoneNumber() {
        guard let phoneNumber = keyChainService.get(key: KeychainService.Keys.phoneNumber.rawValue) else {
            return
        }
        output.gotPhoneNumber(phoneNumber)
    }
    func getSavedPassword() {
        guard let password = keyChainService.get(key: KeychainService.Keys.password.rawValue) else {
            return
        }
        output.gotPassword(password)
    }
    func login(phoneNumber: String, password: String) {
        loginDataProvider.auth(phoneNumber: getClearPhoneNumber(phoneNumber), password: password) {[weak self] (loginResult) in
            if loginResult.success {
                self?.savePassword(password)
                self?.savePhoneNumber(phoneNumber)
            }
            self?.didSignIn(success: loginResult.success)
        }
    }
    func didSignIn(success: Bool) {
        var error: Error?
        if !success {
            error = FailedLoginOrPassword()
        }
        output.didSignIn(success: success, error: error)
    }
    func getClearPhoneNumber(_ phoneNumber: String) -> String {
        let regularExp = try! NSRegularExpression(pattern: "[0-9]*", options: [])
        let result = regularExp.matches(in: phoneNumber as String, options: [], range: NSMakeRange(0, (phoneNumber as NSString).length))
        let resultStringArray = result.map { (phoneNumber as NSString).substring(with: $0.range) }
        return resultStringArray.joined()
    }    
    func getViewModelFrom(_ phoneMask: PhoneMask) -> PhoneMaskViewModel {        
        let mask = phoneMask.mask
        var maskViewModel = (try? mask.wrap(leftSymbol: "{", rightSymbol: "}", using: "[\(Api.digitalMaskSymbol)]*")) ?? ""
        maskViewModel = maskViewModel.replacingOccurrences(of: Api.digitalMaskSymbol, with: "d")
        let maskTemplate = maskViewModel.replacingOccurrences(of: "d", with: "_")
        
        return PhoneMaskViewModel(mask: maskViewModel, template: maskTemplate)
    }
    func getPhoneMask(completionHandler: @escaping (PhoneMaskViewModel) -> Void) {
        loginDataProvider.getPhoneMask {[weak self] (phoneMask) in
            guard let phoneMaskViewModel = self?.getViewModelFrom(phoneMask) else {
                return
            }
            completionHandler(phoneMaskViewModel)
        }
    }
}
