//
//  MainCollectionViewCell.swift
//  Mastagram
//
//  Created by Madeline on 2/7/24.
//

import SnapKit
import UIKit

class MainCollectionViewCell: BaseCollectionViewCell {
    let postImageView = UIImageView()
    let postContent = UILabel()
    let likeButton = UIButton()
    let commentButton = UIButton()
    let shareButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureHierarchy() {
        contentView.addSubview(postImageView)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(postContent)
    }
    
    override func configureLayout() {
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(UIScreen.main.bounds.height * 0.4)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
            make.centerX.equalTo(contentView)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(8)
        }
        
        commentButton.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(likeButton.snp.trailing).offset(8)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(commentButton.snp.trailing).offset(8)
        }
        
        postContent.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).offset(8)
        }
    }
    
    override func configureView() {
        
        contentView.backgroundColor = .white
        
        postImageView.image = UIImage(named: "shark")
        postImageView.contentMode = .scaleAspectFill
        postImageView.tintColor = .black
        
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .black
        
        commentButton.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        commentButton.tintColor = .black
        
        shareButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        shareButton.tintColor = .black
        
        postContent.text = "해저케이블 야미"
        postContent.textColor = .black
        postContent.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    MainCollectionViewCell()
}
