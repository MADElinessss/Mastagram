//
//  ProfileEditViewController.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import SnapKit
import UIKit

let titleLabelList = ["이름", "사용자 이름", "성별 대명사", "소개", "링크", "성별"]

class ProfileEditViewController: BaseViewController {
    
    var content: String = "정연" {
        didSet {
            tableView.reloadData()
        }
    }
    
    let titleLabel = UILabel()
    let backButton = UIButton()
    let completeButton = UIButton()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHeirarchy() {
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(completeButton)
        view.addSubview(tableView)
    }
    
    override func configureLayout() {
        // TODO: navigationBar로 교체
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backButton.snp.bottom).inset(6)
            make.centerX.equalTo(view)
        }

        completeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(44)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        
        backButton.setTitle("취소", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        titleLabel.text = "프로필 편집"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        completeButton.setTitle("완료", for: .normal)
        completeButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        completeButton.setTitleColor(.blue, for: .normal)
        // TODO: 저장
        completeButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileEditTableViewCell.self, forCellReuseIdentifier: "ProfileEditTableViewCell")
        tableView.register(ProfileImagePickerTableViewCell.self, forCellReuseIdentifier: "ProfileImagePickerTableViewCell")
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
}

extension ProfileEditViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UIScreen.main.bounds.height * 0.17
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImagePickerTableViewCell", for: indexPath) as! ProfileImagePickerTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditTableViewCell", for: indexPath) as! ProfileEditTableViewCell
            cell.titleLabel.text = titleLabelList[indexPath.row]
            cell.contentLabel.text = content

            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let vc = LabelEditViewController()
            
            vc.nameSpace = { text in
                self.content = text
            }
            
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}

#Preview {
    ProfileEditViewController()
}
