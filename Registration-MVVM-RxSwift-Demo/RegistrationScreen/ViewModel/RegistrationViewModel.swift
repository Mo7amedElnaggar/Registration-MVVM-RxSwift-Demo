//
//  RegistrationViewModel.swift
//  Registration-MVVM-RxSwift-Demo
//
//  Created by Mohamed El-Naggar on 10/12/21.
//

import Foundation
import RxSwift
import RxCocoa

class RegistrationViewModel {
    
    var firstNameBehavior = BehaviorRelay(value: "")
    var lastNameBehavior = BehaviorRelay(value: "")
    var emailBehavior = BehaviorRelay(value: "")
    var phoneNumberBehavior = BehaviorRelay(value: "")

    var isButtonActive: Observable<Bool> {
        Observable.combineLatest(firstNameBehavior, lastNameBehavior, emailBehavior, phoneNumberBehavior).map { [weak self] (firstName, lastName, email, phoneNumber) in
            let validFirstName = !firstName.isEmpty
            let validlastName = !lastName.isEmpty
            let validEmail = self?.isValidEmail(email) ?? false
            let validPhoneNumber = self?.isValidPhoneNumber(phoneNumber) ?? false
            return validFirstName && validlastName && validEmail && validPhoneNumber
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPhoneNumber(_ phone: String) -> Bool {
        return phone
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
            .count == 10
    }
}
