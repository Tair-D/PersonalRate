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
    view.backgroundColor = .red
    view.delegate = self
    view.dataSource = self
    view.register(RateCell.self, forCellWithReuseIdentifier: "cell")
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private func setupViews() {
    view.addSubview(collectionView)
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setupViews()
    }
}

extension RateViewController: UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RateCell
    return cell
  }
  
  
}





