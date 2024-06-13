//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Egor Ukolov on 09.06.2024.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    
    let itemsPerRow: CGFloat = 2
    let sectionsInsers = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = collectionView.frame.width
        print("Collection View Width: \(collectionViewWidth)")
        
        // Альтернативный способ настройки Loyout
//        let loyout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        loyout.itemSize = CGSize(width: 70, height: 70)
//        loyout.sectionInset = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
//        loyout.minimumInteritemSpacing = 1
//        loyout.minimumLineSpacing = 1
//        loyout.scrollDirection = .vertical
//        
//        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotosCell
            
            photoVC.image = cell.dogImageView.image
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCell
        
        // Configure the cell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.dogImageView.image = image
        
        return cell
    }
    
}

// Подключение возможности настройки Flow Layout через код
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // Определим размер наших ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let paddingWidh = sectionsInsers.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidh
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // Настройка отступов
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionsInsers
    }
    
    // Настройка расстояния между линиями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionsInsers.left
    }
    
    // Настройка расстояния между рядами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionsInsers.left
    }
    
}
