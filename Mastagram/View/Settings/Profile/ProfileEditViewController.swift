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

    let backButton = UIButton()
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHeirarchy() {
        view.addSubview(backButton)
        view.addSubview(tableView)
    }
    
    override func configureLayout() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(44)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        
        backButton.setTitle("취소", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileEditTableViewCell.self, forCellReuseIdentifier: "ProfileEditTableViewCell")
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
}

extension ProfileEditViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileEditTableViewCell", for: indexPath) as! ProfileEditTableViewCell
        cell.titleLabel.text = titleLabelList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LabelEditViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
