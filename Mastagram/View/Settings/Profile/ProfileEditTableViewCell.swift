//
//  ProfileEditTableViewCell.swift
//  Mastagram
//
//  Created by Madeline on 2/8/24.
//

import UIKit


class ProfileEditTableViewCell: BaseTableViewCell {
    
    let titleLabel = UILabel()
    let contentLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.verticalEdges.equalTo(contentView)
        }
        contentLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaInsets).offset(120)
            make.verticalEdges.equalTo(contentView)
        }
    }

    override func configureView() {
        titleLabel.text = "이름"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
}

#Preview {
    ProfileEditTableViewCell()
}
