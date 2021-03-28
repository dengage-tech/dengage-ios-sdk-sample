//
//  InAppMessageViewController.swift
//  ExampleApp
//
//  Created by Nahit Rustu Heper on 11.03.2021.
//

import UIKit
import Dengage_Framework

final class InAppMessageViewController: UIViewController {

    private lazy var deviceIdTextView:UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var screenNameTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Screen Name"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.autocapitalizationType = .none
        view.delegate = self
        return view
    }()
    
    private lazy var navigationButton: UIButton = {
        let view = UIButton()
        view.setTitle("Set Navigation", for: .normal)
        view.addTarget(self, action: #selector(didTapNavigationButton), for: .touchUpInside)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    private lazy var stackView:UIStackView = {
        let view = UIStackView(arrangedSubviews: [deviceIdTextView,
                                                  screenNameTextField,
                                                  navigationButton,
                                                  UIView()])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deviceIdTextView.text = "Device Id:\n" + (Dengage.getDeviceId() ?? "") + "\nContact Key:\n" + (Dengage.getContactKey())
    }
    
    private func setupUI(){
        title = "In"
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc private func didTapNavigationButton(){
        guard let text = screenNameTextField.text else {return}
        Dengage.setNavigation(screenName:text)
        view.endEditing(true)
    }
}


extension InAppMessageViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
