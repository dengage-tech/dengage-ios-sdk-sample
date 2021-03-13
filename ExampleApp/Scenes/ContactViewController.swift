//
//  ContactViewController.swift
//  ExampleApp
//
//  Created by Nahit Rustu Heper on 27.11.2020.
//

import UIKit

final class Subscription: UIViewController {

    private lazy var deviceIdTextView:UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return view
    }()
    
    private lazy var emailTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "email@email.com"
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Register", for: .normal)
        view.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var stackView:UIStackView = {
        let view = UIStackView(arrangedSubviews: [deviceIdTextView,emailTextField])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15).isActive = true
    }
    
    @objc private func didTapRegisterButton(){
        print("fdkjsbajl")
    }
}



