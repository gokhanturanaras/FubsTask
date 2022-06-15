//
//  HorizontalCollectionView.swift
//  FubsTask
//
//  Created by Gökhan Aras on 15.06.2022.
//

import UIKit

class HorizontalCollectionView: UIView {
    var collectionView:UICollectionView!
    var dataSource:[HorizontalCollectionViewDataSource]!
    private var defaultWidth:CGFloat = 276
    private var defaultHeight:CGFloat = 170
    init() {
        super.init(frame: .zero)
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        layout.itemSize = CGSize(width: defaultWidth, height: defaultHeight)
        layout.minimumLineSpacing =  16
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        layout.sectionInset  = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        ])
        
    }
    
    public func setData(dataSource:[HorizontalCollectionViewDataSource]){
        self.dataSource = dataSource
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HorizontalCollectionView: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataSource == nil {
            return 0
        }
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HorizontalCollectionViewCell
        let model = dataSource[indexPath.row]
        cell.contentImage.image = UIImage(named: model.image ?? "")
        cell.titleLabel.setText(model.title)
        cell.subTitleLabel.setText(model.subtitle)
        return cell
    }
    
    
}
