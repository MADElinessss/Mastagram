//
//  LabelEditViewController.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import SnapKit
import UIKit

// MARK: 이름, 사용자 이름, 소개 -> 편집 뷰
class LabelEditViewController: BaseViewController {
    
    var nameSpace: ((String) -> ())?
    var state: String = "name"

    let backButton = UIButton()
    let completeButton = UIButton()
    let titleLabel = UILabel()
    
    let textFieldHeader = UILabel()
    let textField = UITextField()
    let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHeirarchy() {
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(completeButton)
        view.addSubview(textField)
        view.addSubview(textFieldHeader)
        view.addSubview(descriptionLabel)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaInsets).inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(44)
        }
        
        textFieldHeader.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(textField.snp.top).inset(-4)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
    }
    
    override func configureView() {
        
        backButton.setTitle("취소", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        titleLabel.text = state
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        completeButton.setTitle("완료", for: .normal)
        completeButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        completeButton.setTitleColor(.blue, for: .normal)
        // TODO: 저장
        completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        
        textField.text = "정연"
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.borderStyle = .roundedRect
        
        textFieldHeader.text = state
        textFieldHeader.font = .systemFont(ofSize: 14, weight: .medium)
        textFieldHeader.textColor = .gray
        
        descriptionLabel.text = "사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요."
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.textColor = .gray
    }
    
    @objc func backButtonTapped() {
        
        
        dismiss(animated: true)
    }
    
    @objc func completeButtonTapped() {
        let text = textField.text ?? ""
        UserDefaultsManager.shared.name = text
        
        nameSpace?(text)
        
        dismiss(animated: true)
    }
}
