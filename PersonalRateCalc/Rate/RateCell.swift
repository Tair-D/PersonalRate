//
//  RateCell.swift
//  PersonalRateCalc
//
//  Created by Tair Dospayev on 4/1/20.
//  Copyright © 2020 Tair Dospayev. All rights reserved.
//

import UIKit

class RateCell: UICollectionViewCell {
  
  private lazy var purchaseLabel: UILabel = {
    let label = UILabel()
//    label.font = .systemFont(ofSize: 22)
    label.textColor = .black
    label.text = "500"
    label.font = UIFont(name: "Abel", size: 22)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var flagImage: UIImage = {
    let img = UIImage()
    return img
  }()
  
  private lazy var currencyLabel: UILabel = {
    let label = UILabel()
    
    label.text = "USD"
    label.font = UIFont(name: "Abel", size: 22)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  private lazy var saleLabel: UILabel = {
    let label = UILabel()
    label.text = "111"
    label.font = UIFont(name: "Abel", size: 22)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    addSubview(purchaseLabel)
    addSubview(currencyLabel)
    addSubview(saleLabel)
    
    purchaseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    purchaseLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
    purchaseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
//    purchaseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 62).isActive = true
    
    
    currencyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    currencyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
//    currencyLabel.leadingAnchor.constraint(equalTo: purchaseLabel.leadingAnchor, constant: 116).isActive = true
//    currencyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    currencyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//    currencyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 62).isActive = true
    
    saleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
    saleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
    saleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45).isActive = true
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup(purchaseValue: String, currencyValue: String, saleValue: String) {
    self.purchaseLabel.text = purchaseValue
    self.currencyLabel.text = currencyValue
    self.saleLabel.text = saleValue
  }
  
}
