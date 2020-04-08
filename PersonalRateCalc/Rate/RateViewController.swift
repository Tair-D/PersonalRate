//
//  RateViewController.swift
//  PersonalRateCalc
//
//  Created by Tair Dospayev on 3/31/20.
//  Copyright © 2020 Tair Dospayev. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
  
  //MARK: - Properties
  private lazy var contentView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 44
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.black.cgColor
    
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private lazy var separatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var purchaseTitle: UILabel = {
    let label = UILabel()
    label.text = Rate.purchaseTitle
    label.textColor = Colors.lightGrey
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var saleTitle: UILabel = {
    let label = UILabel()
    label.text = Rate.saleTitle
    label.textColor = Colors.lightGrey
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var currencyTitle: UILabel = {
    let label = UILabel()
    label.text = Rate.currencyTitle
    label.textColor = Colors.lightGrey
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = .white
    view.delegate = self
    view.dataSource = self
    view.register(RateCell.self, forCellWithReuseIdentifier: "cell")
    
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var currentDate: UILabel = {
    let label = UILabel()
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    
    label.text = "On " + dateFormatter.string(from: date)
    label.font = Fonts.date
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
  }()
  
  //MARK: - LifeCycle
     override func viewDidLoad() {
         super.viewDidLoad()
       setupViews()
       setupConstraints()
  }
  
  //MARK: - Setup
  private func setupViews() {
    view.backgroundColor = Colors.mainBackgroundColor
    
    [contentView, currentDate].forEach{ view.addSubview($0) }
    
    [purchaseTitle, saleTitle, currencyTitle,separatorView, collectionView].forEach{ contentView.addSubview($0) }
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
    
      currentDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 93.0),
      currentDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      contentView.heightAnchor.constraint(equalToConstant: 252),
      contentView.topAnchor.constraint(equalTo: currentDate.bottomAnchor, constant: 8.0),
      contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
      contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
      
      purchaseTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22.0),
      purchaseTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
      
      currencyTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      currencyTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
      
      saleTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37.0),
      saleTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0),
      
      separatorView.topAnchor.constraint(equalTo: purchaseTitle.bottomAnchor, constant: 9.0),
      separatorView.heightAnchor.constraint(equalToConstant: 1.0),
      separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22.0),
      separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22.0),
      
      collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 14.0),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    ])
  }
  
}

extension RateViewController: UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size: CGSize
    size = CGSize(width: view.frame.width, height: 44)
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RateCell
    cell.backgroundColor = .white
    
    switch indexPath.item {
    case 0:
      cell.setup(purchaseValue: "111", currencyValue: "USD", saleValue: "333.1231", imgName: "united-states")
    case 1:
      cell.setup(purchaseValue: "444", currencyValue: "EUR", saleValue: "666", imgName: "european-union")
    case 2:
      cell.setup(purchaseValue: "777", currencyValue: "RUB", saleValue: "999", imgName: "russia")
    case 3:
      cell.setup(purchaseValue: "111", currencyValue: "GBR", saleValue: "2232", imgName: "united-kingdom")
    default:
      break
    }
    return cell
    }
  }
