import UIKit
import Then
import SnapKit
import RxSwift

class SignUpVC: UIViewController {
    
    private let viewModel = SignUpViewModel()
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 32)
        $0.text = "회원가입"
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
        guard let id = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        print("hi")
        viewModel.fetch(id: id, password: password)
    }

    
    func addView() {
        view.addSubviews(titleLabel, emailTextLabel, emailTextField, passwordTextLabel, passwordTextField, submitBtn)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.centerX.equalToSuperview()
        }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64)
            $0.leading.equalToSuperview().inset(56)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.leading.equalTo(emailTextLabel.snp.leading)
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
