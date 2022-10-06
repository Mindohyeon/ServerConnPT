import UIKit
import Then
import SnapKit

class SignUpVC: UIViewController {
    
    private let viewModel = SignUpViewModel()
    
    private let nameLabel = UILabel().then {
        $0.text = "이륾"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        $0.textColor = .black
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "이름 입력"
    }
    
    private let emailTextLabel = UILabel().then {
        $0.text = "Email"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = .black
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력하세요"
    }
    
    private let passwordTextLabel = UILabel().then {
        $0.text = "Password"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = .black
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "패스워드를 입력하세요."
    }
    
    private lazy var submitBtn = UIButton().then {
        $0.addTarget(self, action: #selector(submitBtnDidTap(_:)), for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("확인", for: .normal)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        addView()
        setLayout()
    }
    
    @objc func submitBtnDidTap(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let id = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        print("hi")
        viewModel.fetch(id: id, password: password)
    }

    
    func addView() {
        view.addSubviews(emailTextLabel, emailTextField, passwordTextLabel, passwordTextField, submitBtn, nameLabel, nameTextField)
    }
    
    func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(64)
            $0.leading.equalToSuperview().inset(56)
        }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(64)
            $0.leading.equalToSuperview().inset(56)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.leading.equalTo(emailTextField.snp.leading)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        submitBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
    }
}
