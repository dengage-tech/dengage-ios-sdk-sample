//
//  TagsViewController.swift
//  ExampleApp
//
//  Created by Nahit Rustu Heper on 25.03.2021.
//

import UIKit
import Dengage_Framework
final class TagsViewController: UIViewController {
    
    private lazy var tagNameTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Tag Name"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.autocapitalizationType = .none
        view.delegate = self
        return view
    }()
    
    private lazy var tagValueTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Tag Value"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.autocapitalizationType = .none
        view.delegate = self
        return view
    }()
    
    private lazy var changeTimeTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Change Time"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.autocapitalizationType = .none
        view.delegate = self
        return view
    }()
    
    private lazy var changeValueTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Change Value"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.autocapitalizationType = .none
        view.delegate = self
        return view
    }()
    
    private lazy var removeTimeTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Remove Time"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.autocapitalizationType = .none
        view.delegate = self
        return view
    }()
    
    private lazy var navigationButton: UIButton = {
        let view = UIButton()
        view.setTitle("Send", for: .normal)
        view.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    private lazy var stackView:UIStackView = {
        let view = UIStackView(arrangedSubviews: [tagNameTextField,
                                                  tagValueTextField,
                                                  changeTimeTextField,
                                                  changeValueTextField,
                                                  removeTimeTextField,
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
        
    }
    
    private func setupUI(){
        title = "Tags"
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaTopAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc private func didTapSendButton(){
        guard let name = tagNameTextField.text else {return}
        guard let value = tagValueTextField.text else {return}
        let changeTime = changeTimeTextField.text
        let changeValue = changeValueTextField.text
        let removeTime = removeTimeTextField.text
        var parameters = [String:String]()
        parameters["tag"] = name
        parameters["value"] = value
        parameters["changeTime"] = changeTime
        parameters["changeValue"] = changeValue
        parameters["removeTime"] = removeTime
        Dengage.setTags([parameters])
    }
}

extension TagsViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
