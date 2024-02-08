//
//  ProfileImagePickerTableViewCell.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import UIKit

class ProfileImagePickerTableViewCell: BaseTableViewCell {

    let profileImage = UIButton()
    let labelButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        contentView.addSubview(profileImage)
        contentView.addSubview(labelButton)
    }
    
    override func configureLayout() {
        profileImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.centerX.equalTo(contentView)
        }
        
        labelButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(24)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(16)
        }
        
    }

    override func configureView() {
        profileImage.setImage(UIImage(named: "shark"), for: .normal)
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 50
        profileImage.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        labelButton.setTitle("사진 또는 아바타 수정", for: .normal)
        labelButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        labelButton.setTitleColor(.blue, for: .normal)
        labelButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
    @objc func profileButtonTapped() {
        // TODO: 이미지 피커 띄우기
    }
}

#Preview {
    ProfileImagePickerTableViewCell()
}
