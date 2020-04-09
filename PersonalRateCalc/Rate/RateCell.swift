//
//  RateCell.swift
//  PersonalRateCalc
//
//  Created by Tair Dospayev on 4/1/20.
//  Copyright © 2020 Tair Dospayev. All rights reserved.
//

import UIKit

class RateCell: UICollectionViewCell {
  
  //MARK: - Properties
  private lazy var purchaseLabel: UILabel = {
    let label = UILabel()
    label.font = Fonts.rateContent
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var flagImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var currencyLabel: UILabel = {
    let label = UILabel()
    label.font = Fonts.rateContent
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var saleLabel: UILabel = {
    let label = UILabel()
    label.font = Fonts.rateContent
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupViews()
    setupConstraints()
  }
  
  //MARK: - Setups
  
  private func setupViews() {
    [purchaseLabel, currencyLabel, saleLabel, flagImageView].forEach{ addSubview($0) }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      purchaseLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14.0),
      purchaseLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14.0),
      purchaseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.0),
      
      currencyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14.0),
      currencyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14.0),
      currencyLabel.leadingAnchor.constraint(equalTo: purchaseLabel.leadingAnchor, constant: 175),
      
      saleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14.0),
      saleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14.0),
      saleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45.0),
      
      flagImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14.0),
      flagImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14.0),
      flagImageView.widthAnchor.constraint(equalToConstant: 20),
      flagImageView.heightAnchor.constraint(equalToConstant: 20),
      flagImageView.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -10.0),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup(purchaseValue: String, currencyValue: String, saleValue: String, imgName: String) {
    self.purchaseLabel.text = purchaseValue
    self.currencyLabel.text = currencyValue
    self.saleLabel.text = saleValue
    
    self.flagImageView.image = UIImage(named: imgName)
  }
  
}
