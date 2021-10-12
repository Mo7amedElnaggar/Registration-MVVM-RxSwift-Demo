//
//  RegistrationVC.swift
//  Registration-MVVM-RxSwift-Demo
//
//  Created by Mohamed El-Naggar on 10/12/21.
//

import UIKit
import RxSwift

class RegistrationVC: UIViewController {

    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var registerBtn: RegisterButton!

    var disposeBag = DisposeBag()
    var registerViewModel = RegistrationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindTextFields()
        bindRegisterButton()
        textFieldsControlEvents()
        subscribeOnRegisterButtonTap()
    }
    
    func bindTextFields() {
        firstNameTF.rx.text.orEmpty.bind(to: registerViewModel.firstNameBehavior).disposed(by: disposeBag)
        lastNameTF.rx.text.orEmpty.bind(to: registerViewModel.lastNameBehavior).disposed(by: disposeBag)
        emailTF.rx.text.orEmpty.bind(to: registerViewModel.emailBehavior).disposed(by: disposeBag)
        phoneTF.rx.text.orEmpty.bind(to: registerViewModel.phoneNumberBehavior).disposed(by: disposeBag)
    }
    
    func bindRegisterButton() {
        registerViewModel.isButtonActive.bind(to: registerBtn.rx.isActive).disposed(by: disposeBag)
    }
    
    func textFieldsControlEvents() {
        phoneTF.rx.controlEvent(.editingChanged).subscribe(onNext: { [weak self] in
            if let text = self?.phoneTF.text {
                let phoneValidator = String(text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined().prefix(10))
                self?.phoneTF.text = phoneValidator
                self?.registerViewModel.phoneNumberBehavior.accept(phoneValidator)
            }
        }).disposed(by: disposeBag)
    }
    
    func subscribeOnRegisterButtonTap() {
        registerBtn.rx.tap.subscribe(onNext: {
            print("Register Button Tap")
        }).disposed(by: disposeBag)
    }
}
