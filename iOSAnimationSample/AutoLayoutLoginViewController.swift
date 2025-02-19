//
//  AutoLayoutLoginViewController.swift
//  iOSAnimationSample
//
//  Created by Jake Lin on 10/9/15.
//  Copyright © 2015 JakeLin. All rights reserved.
//

import UIKit

class AutoLayoutLoginViewController: UIViewController {
  
  //MARK: IB outlets
  @IBOutlet var bubbleImageViewGroup1: [UIImageView]!
  @IBOutlet var bubbleImageViewGroup2: [UIImageView]!
  @IBOutlet var dotImageView: UIImageView!
  @IBOutlet var logoImageView: UIImageView!
  @IBOutlet var usernameTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var loginButton: UIButton!
  @IBOutlet var warningMessageView: UIView!
  
  @IBOutlet var loginButtonTopMarginConstraint: NSLayoutConstraint!
  @IBOutlet var loginButtonWidthConstraint: NSLayoutConstraint!
  
  // Customer UI
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup all bubbles start transform
    for bubble in bubbleImageViewGroup1 {
        bubble.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    for bubble in bubbleImageViewGroup2 {
        bubble.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    // Setup username and password textfields
    let paddingViewForUsername = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: usernameTextField.frame.height))
    usernameTextField.leftView = paddingViewForUsername
    usernameTextField.leftViewMode = .always
    
    let userImageView = UIImageView(image: UIImage(named: "User"))
    userImageView.frame.origin = CGPoint(x: 13, y: 10)
    usernameTextField.addSubview(userImageView)
    
    let paddingViewForPassword = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: passwordTextField.frame.height))
    passwordTextField.leftView = paddingViewForPassword
    passwordTextField.leftViewMode = .always
    
    let passwordImageView = UIImageView(image: UIImage(named: "Key"))
    passwordImageView.frame.origin = CGPoint(x: 12, y: 9)
    passwordTextField.addSubview(passwordImageView)
    
    // Prepare the elements for animations
    logoImageView.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
    dotImageView.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
    usernameTextField.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
    passwordTextField.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
    loginButton.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
  }
  
  //MARK: - IBActions
  @IBAction func startAnimationDidTap(_ sender: AnyObject) {
    animate()
  }
  
  @IBAction func loginDidTap(_ sender: AnyObject) {
    loginButton.addSubview(spinner)
    spinner.frame.origin = CGPoint(x: 12, y: 12)
    spinner.startAnimating()
    
    loginButtonTopMarginConstraint.constant = 120
    loginButtonWidthConstraint.constant -= 60
    UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
      animations: {
        self.view.layoutIfNeeded()
      }, completion: { _ in
        self.spinner.removeFromSuperview()
        self.loginButtonWidthConstraint.constant += 60
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [],
          animations: {
            self.view.layoutIfNeeded()
          }, completion: nil
        )
        
        UIView.transition(with: self.warningMessageView,
          duration: 0.3,
          options: [.transitionFlipFromTop, .curveEaseOut],
          animations: {
            self.warningMessageView.isHidden = false
          }, completion: nil
        )
      }
    )
  }
  
  // MARK: - Private methods
  private func animate() {
    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [],
      animations: {
        for bubble in self.bubbleImageViewGroup1 {
            bubble.transform = CGAffineTransform.identity
        }
      }, completion: nil
    )
    
    UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [],
      animations: {
        for bubble in self.bubbleImageViewGroup2 {
            bubble.transform = CGAffineTransform.identity
        }
      }, completion: nil
    )
    
    UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
      animations: {
        self.logoImageView.transform = CGAffineTransform.identity
      }, completion: nil
    )
    
    UIView.animate(withDuration: 0.6, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [],
      animations: {
        self.dotImageView.transform = CGAffineTransform.identity
      }, completion: nil
    )

    UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
      animations: {
        self.usernameTextField.transform = CGAffineTransform.identity
      }, completion: nil
    )
    
    UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
      animations: {
        self.passwordTextField.transform = CGAffineTransform.identity
      }, completion: nil
    )
    
    UIView.animate(withDuration: 0.3, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [],
      animations: {
        self.loginButton.transform = CGAffineTransform.identity
      }, completion: nil
    )
  }
}
