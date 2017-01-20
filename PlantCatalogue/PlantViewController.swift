//
//  ViewController.swift
//  PlantCatalogue
//
//  Created by Mac on 12/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background image at layer 0
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		//backgroundImage.image = UIImage(named: "greenbackground.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        backgroundImage.clipsToBounds = true
		backgroundImage.backgroundColor = Color.custom(hexString: "#E0F7FA", alpha: 1.0).value
        view.insertSubview(backgroundImage, at: 0)
        
        // Set title of navigation bar title
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Plant Details"
        titleLabel.textColor = Color.theme.value
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        navigationItem.titleView = titleLabel
        
        // Setup menu bar
        setupMenuBar()
        
        // Set title bar color
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Color.theme.withAlpha(0.8)
        
         // Register collectionView cellID
        collectionView?.register(PlantCell.self, forCellWithReuseIdentifier: "cellID")
        
        // Collection cell background cell color
        collectionView?.backgroundColor = UIColor.clear
        
        // Push collection View down 50 pixels (size of menuBar)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        // Hide menubar upon scroll
        navigationController?.hidesBarsOnSwipe = true
        
        // Create a view that is colored and hides the issue when scrolling
        let hideView = UIView()
        hideView.backgroundColor = Color.theme.withAlpha(1.0)
        view.addSubview(hideView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: hideView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: hideView)
        
        // Add menuBar
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        // Constraints the scroll view to the top of the menuBar
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
//# MARK: - UICollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Return number of cells in collection view
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // Change background cell color with a alpha tint
        view.backgroundColor = UIColor.clear
        // Setup the size of each collectionView cell
        return CGSize(width: view.frame.width, height: 500)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        // Set minimum line spacing between collectionView cells
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Associate cell with cellID
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


