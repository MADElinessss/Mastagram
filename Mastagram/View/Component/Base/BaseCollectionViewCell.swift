//
//  BaseCollectionViewCell.swift
//  Mastagram
//
//  Created by Madeline on 2/7/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        
    }
    func configureLayout() {
        
    }
    func configureView() {
        
    }
    
}
