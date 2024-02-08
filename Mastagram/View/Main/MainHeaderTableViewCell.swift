//
//  MainHeaderTableViewCell.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import SnapKit
import UIKit

class MainHeaderTableViewCell: UITableViewCell {
    
    var callBackMehtod: (() -> Void)?

    let logoImage = UIImageView()
    let likeButton = UIButton()
    let profileButton = UIButton()
    let shareButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(logoImage)
        contentView.addSubview(likeButton)
        contentView.addSubview(profileButton)
        contentView.addSubview(shareButton)
    }
    
    func configureLayout() {
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(44)
            make.height.equalTo(44)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.trailing.equalTo(shareButton.snp.leading).inset(-8)
        }
        
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.trailing.equalTo(likeButton.snp.leading).inset(-8)
            make.height.equalTo(24)
        }
        
    }

    func configureView() {
        logoImage.image = UIImage(named: "logo_light")
        logoImage.contentMode = .scaleAspectFill
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .black
        
        profileButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        profileButton.tintColor = .black
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        shareButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        shareButton.tintColor = .black
    }
    
    @objc func profileButtonTapped() {
        callBackMehtod?()
    }
}


#Preview {
    MainHeaderTableViewCell()
}
