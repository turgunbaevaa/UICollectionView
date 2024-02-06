//
//  ViewController.swift
//  UICollectionView
//
//  Created by Aruuke Turgunbaeva on 4/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 200)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.collectionView?.layer.cornerRadius = 16
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCVCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private let verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 30, height: 200)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .vertical
        layout.collectionView?.layer.cornerRadius = 16
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCVCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    let filterByPopularityButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Most Popular"
        config.image = UIImage(systemName: "arrow.up.arrow.down")
        config.imagePadding = 8
        let button = UIButton(configuration: config)
        button.semanticContentAttribute = .forceRightToLeft
        button.tintColor = .red
        button.configuration!.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8.0, bottom: 0, trailing: 0)
        return button
    }()

    private let sortByLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Sort By"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private let horizontalData = ["salad2", "salad", "salad3"]
    private let verticalData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self

        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        
        view.backgroundColor = .white
        
        view.addSubview(horizontalCollectionView)
        NSLayoutConstraint.activate([
            horizontalCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        setupSortByLabel()
        setupButton()
        
        view.addSubview(verticalCollectionView)
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(equalTo: filterByPopularityButton.bottomAnchor, constant: 20),
            verticalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupButton(){
        view.addSubview(filterByPopularityButton)
        filterByPopularityButton.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.centerY.equalTo(sortByLabel.snp.centerY)
            make.width.equalTo(180)
            make.height.equalTo(40)
        }
    }
    
    private func setupSortByLabel(){
        view.addSubview(sortByLabel)
        sortByLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizontalCollectionView {
            return horizontalData.count
        } else {
            return verticalData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCVCell
        
        if collectionView == horizontalCollectionView {
            cell?.setImage(image: horizontalData[indexPath.item])
        } else {
            cell?.setImage(image: verticalData[indexPath.item])
        }
        
        return cell ?? UICollectionViewCell()
        
    }
}

