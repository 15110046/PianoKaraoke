//
//  LoginViewController.swift
//  Piano_App
//
//  Created by Nguyen Hieu on 3/18/19.
//  Copyright © 2019 com.nguyenhieu.demo. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class LoginViewController: UIViewController {
    private var presenter: LoginPresenter?
    func inject(presenter: LoginPresenter) {
        self.presenter = presenter
    }
    private var marginLeftUsernameTextField: CGFloat {
        return 50
    }
    private var marginLeftViewBottomUsernameTextField: CGFloat {
        return marginLeftUsernameTextField - 10
    }
    private var heightViewtitle: CGFloat {
        return 0.25*UIScreen.main.bounds.size.height
    }
    private var heightViewTextField: CGFloat {
        return heightViewtitle
    }
    private var heightViewButton: CGFloat {
        return 1.2*heightViewtitle
    }
    private var heightViewBottom: CGFloat {
        return UIScreen.main.bounds.size.height - heightViewtitle - heightViewTextField - heightViewButton
    }
    
    private let backgroundImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "backgroundLogin"))
        img.backgroundColor = .clear
        img.translatesAutoresizingMaskIntoConstraints = false
        img.alpha = 1
        return img
    }()
    private let viewTitle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private let titleLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Piano Karaoke"
        lbl.font = UIFont(name: "AmericanTypewriter-Bold", size: 40)
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    private let viewTextFiled: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private let viewTextFieldExtra: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private let userNameTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.textColor = .white
        txtField.changeColor(placeholder: "Tên đăng nhập", color: .white)
        txtField.borderStyle = UITextField.BorderStyle.none
        return txtField
    }()
    private let viewBottomUserNameTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let passWordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.textColor = .white
        txtField.changeColor(placeholder: "Mật khẩu", color: .white)
        txtField.borderStyle = UITextField.BorderStyle.none
        txtField.isSecureTextEntry = true
        return txtField
    }()
    private let viewBottomPasswdTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let viewButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private let buttonLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("Đăng nhập", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(clickLoginButton), for: UIControl.Event.touchDown)
        return btn
    }()
    private let buttonLoginFb: FBSDKButton = {
        let btn = FBSDKButton()
        btn.setTitle("Đăng nhập với Facebook", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action:  #selector(clickLoginFB), for: UIControl.Event.touchDown)
        return btn
    }()
    private let viewBottom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private let buttonCreateAccount: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Tạo tài khoản", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mapUI()
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func clickLoginFB() {
        let login = FBSDKLoginManager()
        print("click login")
        login.logIn(withReadPermissions: ["public_profile"], from: self) {[weak self] (result, error) in
            guard let strongSelf = self else { return }
            if error != nil {
                print(error ?? "")
            }
            else {
                strongSelf.presenter?.moveToScreen()
            }
        }
    }
    
    @objc private func clickLoginButton() {
        presenter?.moveToHome(username: userNameTextField.text ?? "" , passwd: passWordTextField.text ?? "", alert: self)
    }
    private func mapUI() {
        view.addSubview(backgroundImage)
        view.addSubview(viewTitle)
        view.addSubview(viewTextFiled)
        view.addSubview(viewButton)
        view.addSubview(viewBottom)
        viewTitle.addSubview(titleLable)
        viewTextFiled.addSubview(viewTextFieldExtra)
        viewTextFieldExtra.addSubview(userNameTextField)
        viewTextFieldExtra.addSubview(viewBottomUserNameTextField)
        viewTextFiled.addSubview(passWordTextField)
        viewTextFiled.addSubview(viewBottomPasswdTextField)
        viewButton.addSubview(buttonLogin)
        viewButton.addSubview(buttonLoginFb)
        viewBottom.addSubview(buttonCreateAccount)
        autoLayoutBackgroundImage()
        autoLayoutViewTitle()
        autoLayoutViewTextField()
        autoLayoutViewButton()
        autoLayoutViewBottom()
        autoLayoutTitleLable()
        autoLayoutViewTextFieldExtra()
        autoLayoutUsernameTextField()
        autoLayoutViewBottomUserNameTextField()
        autoLayoutPasswdTextField()
        autoLayoutViewBottomPasswdTextField()
        autoLayoutButtonLogin()
        autoLayoutButtonLoginFb()
        autoLayoutButtonCreateAccount()
        
    }
    private func autoLayoutButtonCreateAccount() {
        buttonCreateAccount.centerXAnchor.constraint(equalTo: viewBottom.centerXAnchor, constant: 0).isActive = true
        buttonCreateAccount.centerYAnchor.constraint(equalTo: viewBottom.centerYAnchor, constant: 0).isActive = true
    }
    private func autoLayoutButtonLoginFb() {
        buttonLoginFb.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 30).isActive = true
        buttonLoginFb.heightAnchor.constraint(equalTo: buttonLogin.heightAnchor, multiplier: 1).isActive = true
        buttonLoginFb.widthAnchor.constraint(equalTo: buttonLogin.widthAnchor, multiplier: 1).isActive = true
        buttonLoginFb.rightAnchor.constraint(equalTo: buttonLogin.rightAnchor, constant: 0).isActive = true
    }
    private func autoLayoutButtonLogin() {
        viewButton.layoutIfNeeded()
        let height = viewButton.bounds.size.height/4.5
        buttonLogin.topAnchor.constraint(equalTo: viewButton.topAnchor, constant: 10).isActive = true
        buttonLogin.centerXAnchor.constraint(equalTo: viewButton.centerXAnchor).isActive = true
        buttonLogin.leftAnchor.constraint(equalTo: viewButton.leftAnchor, constant: marginLeftViewBottomUsernameTextField - 10).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    private func autoLayoutViewBottomPasswdTextField() {
        viewBottomPasswdTextField.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor, constant: 9).isActive = true
        viewBottomPasswdTextField.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewBottomPasswdTextField.leadingAnchor.constraint(equalTo: viewBottomUserNameTextField.leadingAnchor, constant: 0).isActive = true
        viewBottomPasswdTextField.trailingAnchor.constraint(equalTo: viewBottomUserNameTextField.trailingAnchor, constant: 0).isActive = true
    }
    private func autoLayoutPasswdTextField() {
        passWordTextField.topAnchor.constraint(equalTo: viewTextFieldExtra.bottomAnchor, constant: 20).isActive = true
        passWordTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor, constant: 0).isActive = true
        passWordTextField.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor, constant: 0).isActive = true
    }
    private func autoLayoutViewBottomUserNameTextField() {
        viewBottomUserNameTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 9).isActive = true
        viewBottomUserNameTextField.heightAnchor.constraint(equalToConstant: 1).isActive = true
        viewBottomUserNameTextField.leftAnchor.constraint(equalTo: viewTextFieldExtra.leftAnchor, constant: marginLeftViewBottomUsernameTextField).isActive = true
        viewBottomUserNameTextField.centerXAnchor.constraint(equalTo: viewTextFieldExtra.centerXAnchor, constant: 0).isActive = true
    }
    private func autoLayoutUsernameTextField() {
        userNameTextField.bottomAnchor.constraint(equalTo: viewTextFieldExtra.bottomAnchor, constant: -10).isActive = true
        userNameTextField.leftAnchor.constraint(equalTo: viewTextFieldExtra.leftAnchor, constant: marginLeftUsernameTextField).isActive = true
        userNameTextField.centerXAnchor.constraint(equalTo: viewTextFieldExtra.centerXAnchor, constant: 0).isActive = true
    }
    private func autoLayoutViewTextFieldExtra() {
        viewTextFiled.layoutIfNeeded()
        let height = viewTextFiled.bounds.size.height / 2
        viewTextFieldExtra.topAnchor.constraint(equalTo: viewTextFiled.topAnchor, constant: 0).isActive = true
        viewTextFieldExtra.rightAnchor.constraint(equalTo: viewTextFiled.rightAnchor, constant: 0).isActive = true
        viewTextFieldExtra.leftAnchor.constraint(equalTo: viewTextFiled.leftAnchor, constant: 0).isActive = true
        viewTextFieldExtra.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    private func autoLayoutTitleLable() {
        titleLable.bottomAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: -20).isActive = true
        titleLable.rightAnchor.constraint(equalTo: viewTitle.rightAnchor, constant: -20).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: viewTitle.centerXAnchor, constant: 0).isActive = true
    }
    private func autoLayoutViewBottom() {
        viewBottom.topAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: 0).isActive = true
        viewBottom.rightAnchor.constraint(equalTo: viewButton.rightAnchor, constant: 0).isActive = true
        viewBottom.leftAnchor.constraint(equalTo: viewButton.leftAnchor, constant: 0).isActive = true
        viewBottom.heightAnchor.constraint(equalToConstant: heightViewBottom).isActive = true
    }
    private func autoLayoutViewButton() {
        viewButton.topAnchor.constraint(equalTo: viewTextFiled.bottomAnchor, constant: 0).isActive = true
        viewButton.rightAnchor.constraint(equalTo: viewTextFiled.rightAnchor, constant: 0).isActive = true
        viewButton.leftAnchor.constraint(equalTo: viewTextFiled.leftAnchor, constant: 0).isActive = true
        viewButton.heightAnchor.constraint(equalToConstant: heightViewButton).isActive = true
    }
    private func autoLayoutViewTextField() {
        viewTextFiled.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 0).isActive = true
        viewTextFiled.leftAnchor.constraint(equalTo: viewTitle.leftAnchor, constant: 0).isActive = true
        viewTextFiled.rightAnchor.constraint(equalTo: viewTitle.rightAnchor, constant: 0).isActive = true
        viewTextFiled.heightAnchor.constraint(equalToConstant: heightViewTextField).isActive = true
    }
    private func autoLayoutViewTitle() {
        viewTitle.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        viewTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewTitle.heightAnchor.constraint(equalToConstant: heightViewtitle).isActive = true
    }
    private func autoLayoutBackgroundImage() {
        backgroundImage.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    }
    
    
}
protocol LoginViewControllerInterface {
    func showAlert(stringTitle: String, stringMessages: String)
    func getUIController() -> UIViewController
}
extension LoginViewController: LoginViewControllerInterface {
    func getUIController() -> UIViewController {
        return self
    }
    func showAlert(stringTitle: String, stringMessages: String) {
        self.showAlert(withTitle: stringTitle, withMessage: stringMessages)
    }
}
