//
//  pictureViewController.swift
//  MuralSwitcharoo
//
//  Created by Alexander Masztak on 4/26/22.
//

import UIKit

struct CustomData {
    var image: UIImage
}

class pictureViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var data = [
        CustomData(image: UIImage(named:"pic1")!),
        CustomData(image: UIImage(named:"pic2")!),
        CustomData(image: UIImage(named:"pic3")!),
        CustomData(image: UIImage(named:"pic4")!)
    ]
    
    private var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/4)-4, height: (view.frame.size.width/4)-4)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CustomCell.self,
                                 forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource =  self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)

        let gesture = UILongPressGestureRecognizer(target: self,
                                                   action: #selector(handleLongPressGesture(gesture :)))
        collectionView?.addGestureRecognizer(gesture)
    }
    
    @objc func handleLongPressGesture( gesture: UILongPressGestureRecognizer) {
        guard let collectionView = collectionView else {
            return
        }
        
        switch gesture.state{
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else{
                return
            }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame  = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/4)-4,
                      height: (view.frame.size.width/4)-4)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data.remove(at: sourceIndexPath.row)
        data.insert(item, at: destinationIndexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet{
            guard let data = data else {return}
            image.image = data.image
        }
    }
    
    fileprivate let image: UIImageView = {
        let a = UIImageView()
        a.image = UIImage(named: "pic1")
        a.translatesAutoresizingMaskIntoConstraints = false
        a.contentMode = .scaleAspectFill
        a.clipsToBounds = true
        return a
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(image)
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
