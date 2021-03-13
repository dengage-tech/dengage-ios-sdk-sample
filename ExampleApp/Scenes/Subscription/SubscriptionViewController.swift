import UIKit
import Dengage_Framework

final class SubscriptionViewController: UIViewController {

    private lazy var deviceIdTextView:UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return view
    }()
    
    private lazy var emailTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "email@email.com"
        view.textAlignment = .center
        view.borderStyle = .bezel
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Set Contact Key", for: .normal)
        view.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    private lazy var stackView:UIStackView = {
        let view = UIStackView(arrangedSubviews: [deviceIdTextView,emailTextField,registerButton])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        deviceIdTextView.text = Dengage.getDeviceId()
    }
    
    private func setupUI(){
        title = "Subscription"
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaTopAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc private func didTapRegisterButton(){
        guard let text = emailTextField.text else {return}
        Dengage.setContactKey(contactKey: text)
    }
}



