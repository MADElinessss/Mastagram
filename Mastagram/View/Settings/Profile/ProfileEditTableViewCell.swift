//
//  ProfileEditTableViewCell.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import UIKit


class ProfileEditTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()

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
        contentView.addSubview(titleLabel)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.verticalEdges.equalTo(contentView)
        }
        
    }

    func configureView() {
        titleLabel.text = "이름"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
}

#Preview {
    ProfileEditTableViewCell()
}
