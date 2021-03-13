
import Dengage_Framework
import UIKit

final class EventViewController: UIViewController {

    private lazy var eventNameTextField:UITextField = {
        let view = UITextField()
        view.placeholder = "Event Name"
        view.textAlignment = .center
        view.borderStyle = .bezel
        view.textColor = .black
        view.backgroundColor = .blue
        return view
    }()
        
    private lazy var sendButton: UIButton = {
        let view = UIButton()
        view.setTitle("Send Event", for: .normal)
        view.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    private lazy var addParameterButton: UIButton = {
        let view = UIButton()
        view.setTitle("+ Add New Parameter", for: .normal)
        view.addTarget(self, action: #selector(didTapAddParameterButton), for: .touchUpInside)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    private lazy var stackView:UIStackView = {
        let view = UIStackView(arrangedSubviews: [eventNameTextField, addParameterButton, sendButton])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        title = "Event Collection"
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaTopAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        addParameterItemView()
    }
    
    @objc private func didTapSendButton(){

        let eventName = eventNameTextField.text ?? ""
        let parameters:NSMutableDictionary = stackView.arrangedSubviews
            .compactMap{$0 as? EventParameterItemView}
            .compactMap{$0.values}
            .reduce(into: [:]) { $0[$1.0] = $1.1 }


        Dengage.SendDeviceEvent(toEventTable: eventName, andWithEventDetails: parameters)
    }
    
    @objc private func didTapAddParameterButton(){
        addParameterItemView()
    }

    private func addParameterItemView(){
        let view = EventParameterItemView()
        stackView.insertArrangedSubview(view, at: 1)
    }
}


extension EventViewController{
    final class EventParameterItemView: UIView{
        
        private lazy var keyTextField:UITextField = {
            let view = UITextField()
            view.placeholder = "key"
            view.borderStyle = .bezel
            view.textColor = .black
            view.backgroundColor = .blue
            return view
        }()
        
        private lazy var valueTextField:UITextField = {
            let view = UITextField()
            view.placeholder = "value"
            view.borderStyle = .bezel
            view.textColor = .black
            view.backgroundColor = .blue
            return view
        }()
        
        private lazy var stackView:UIStackView = {
            let view = UIStackView(arrangedSubviews: [keyTextField, valueTextField])
            view.axis = .horizontal
            view.translatesAutoresizingMaskIntoConstraints = false
            view.spacing = 10
            view.distribution = .fillEqually
            return view
        }()
        
        init() {
            super.init(frame: .zero)
            addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        var values:(String,String)?{
            guard let key = keyTextField.text, let value = valueTextField.text else {return nil}
            return (key,value)
        }
    }
}
