//
//  CustomCVCell.swift
//  UICollectionView
//
//  Created by Aruuke Turgunbaeva on 4/2/24.
//

import UIKit
import SnapKit

class CustomCVCell: UICollectionViewCell {
    
    private let photoIV: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 16
        img.clipsToBounds = true
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoIV)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        
        photoIV.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
    }
    
    func setImage(image: String) {
        photoIV.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
