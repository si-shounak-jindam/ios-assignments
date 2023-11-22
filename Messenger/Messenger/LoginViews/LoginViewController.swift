//
//  LoginViewController.swift
//  Messenger
//
//  Created by Shounak Jindam on 10/10/23.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController  {
    
    //MARK: - IBOutlets
    
    
    //label
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    @IBOutlet weak var repeatLabelOutlet: UILabel!
    
    @IBOutlet weak var signUpLabelOutlet: UILabel!
    //textFields
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    //Buttons
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    @IBOutlet weak var ResendEmailButtonOutlet: UIButton!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    //Views
    @IBOutlet weak var repeatPasswordLineView: UIView!
    
    
    //MARK: - Var
    
    var isLogin = true
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIFor(login: true)
        setupTextFieldDelegate()
        setUpBackgroundTap()
        
    }
    
    //MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: isLogin ? "login" : "register"){
            
            isLogin ? loginUser() : registerUser()
            
            
        } else {
            ProgressHUD.showFailed("All Fields are required")
        }
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "password"){
            resetPassword()
        } else {
            ProgressHUD.showFailed("Email is required")
        }
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "password"){
            resendVerificationEmail()
        }else{
            ProgressHUD.showFailed("Email is required")
        }
        
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
    }
    
    //MARK: - Setup
    private func setupTextFieldDelegate(){
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        updatePlaceHolderLabels(textField: textField)
        
    }
    
    private func setUpBackgroundTap(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap() {
        
        view.endEditing(false)
    }
    
    
    
    //MARK: -Animations
    private func updateUIFor(login: Bool){
        
        loginButtonOutlet.setImage(UIImage(named: login ? "loginBtn" : "registerBtn"), for: .normal)
        signUpButtonOutlet.setTitle(login ? "SignUp" : "Login", for: .normal)
        
        signUpLabelOutlet.text = login ? "Don't have an account?" : "Have an account?"
        
        UIView.animate(withDuration: 0.5){
            
            self.repeatPasswordTextField.isHidden = login
            self.repeatLabelOutlet.isHidden = login
            self.repeatPasswordLineView.isHidden = login
        }
    }
    
    
    private func updatePlaceHolderLabels(textField: UITextField){
        
        switch textField {
        case emailTextField:
            emailLabelOutlet.text = textField.hasText ? "Email" : ""
        case passwordTextField:
            passwordLabelOutlet.text = textField.hasText ? "Password" : ""
        default:
            repeatLabelOutlet.text = textField.hasText ? "Repeat Password" : ""
        }
    }
    
    //MARK: - Helpers
    private func isDataInputedFor(type: String) -> Bool {
        
        switch type {
        case "login":
            return emailTextField.text != "" && passwordTextField.text != ""
            
        case "registration":
            return emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != ""
            
        default:
            return emailTextField.text != ""
        }
    }
    
    private func loginUser(){
        FirebaseUserListener.shared.loginUserWithEmail(email: emailTextField.text!, password: passwordTextField.text!) {
            (error, isEmailVerified)in
            if error == nil {
                if isEmailVerified {
                    //go to app
                    self.goToApp()
                } else {
                    ProgressHUD.showFailed("Please verify email.")
                    self.ResendEmailButtonOutlet.isHidden = false
                }
            } else {
                ProgressHUD.showFailed(error!.localizedDescription)
            }
        }
    }
    
    private func registerUser(){
        if passwordTextField.text! == repeatPasswordTextField.text! {
            FirebaseUserListener.shared.registerUserWith(email: emailTextField.text!, password:
                                                            passwordTextField.text!) { (error) in
                
                if error == nil {
                    ProgressHUD.showSuccess("Verification email sent.")
                    self.ResendEmailButtonOutlet.isHidden = false
                } else {
                    ProgressHUD.showFailed(error!.localizedDescription)
                }
            }
        } else {
            ProgressHUD.showFailed("The Passwords don't match")
        }
    }
    
    
    private func resetPassword(){
        FirebaseUserListener.shared.resetPasswordFor(email: emailTextField.text!) {
            (error) in
            if error == nil {
                ProgressHUD.showSucceed("Resend link sent to email")
            } else {
                ProgressHUD.showFailed(error!.localizedDescription)
            }
        }
    }
        
    private func resendVerificationEmail() {
        FirebaseUserListener.shared.resendVerificationEmail(email: emailTextField.text!) { (error) in
            if error == nil {
                ProgressHUD.showSucceed("New Verification Email Sent")
            } else {
                ProgressHUD.showFailed(error!.localizedDescription)
                print(error!.localizedDescription)
            }
        }
    }
    //MARK: Navigation
    
    private func goToApp() {
        
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView")  as! UITabBarController
        
        mainView.modalPresentationStyle = .fullScreen
        self.present(mainView, animated: true, completion: nil)
    }
    
    
}
