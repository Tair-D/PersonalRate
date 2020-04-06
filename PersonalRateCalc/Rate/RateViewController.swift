//
//  RateViewController.swift
//  PersonalRateCalc
//
//  Created by Tair Dospayev on 3/31/20.
//  Copyright © 2020 Tair Dospayev. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

  private lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = .lightGray
    view.delegate = self
    view.dataSource = self
    view.register(RateCell.self, forCellWithReuseIdentifier: "cell")
    view.layer.cornerRadius = 44
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.black.cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var currentDate: UILabel = {
    let label = UILabel()
    
    label.text = "On 01.04.2020"
    label.font = UIFont(name: "Abel", size: 30)
    label.textColor = .lightGray
    return label
    
  }()
  private func setupViews() {
    view.backgroundColor = .white
    view.addSubview(collectionView)
    view.addSubview(currentDate)
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 126).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -420).isActive = true
//    collectionView.widthAnchor.constraint(equalTo: view.widthAnchor)
//    collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 252)
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    
    currentDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 83).isActive = true
    currentDate.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setupViews()
    }
}

extension RateViewController: UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size: CGSize
    size = CGSize(width: view.frame.width, height: 70)
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
//    switch section {
//    case 0:
//      return 1
//    default:
//      return 0
//    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RateCell
    cell.backgroundColor = .white
    
    switch indexPath.item {
    case 0:
      cell.setup(purchaseValue: "Purchase", currencyValue: "Currency", saleValue: "Sale")
      
    case 1:
      cell.setup(purchaseValue: "111", currencyValue: "222", saleValue: "333")
    case 2:
      cell.setup(purchaseValue: "444", currencyValue: "555", saleValue: "666")
    case 3:
      cell.setup(purchaseValue: "777", currencyValue: "888", saleValue: "999")
    case 4:
      cell.setup(purchaseValue: "111", currencyValue: "321", saleValue: "2232")
    default:
      break
    }
    return cell
    }
  }




