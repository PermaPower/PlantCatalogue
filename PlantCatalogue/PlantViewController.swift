//
//  ViewController.swift
//  PlantCatalogue
//
//  Created by Mac on 12/1/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background image at layer 0
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
       backgroundImage.image = UIImage(named: "greenbackground.jpg")
       backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
       backgroundImage.clipsToBounds = true
       view.insertSubview(backgroundImage, at: 0)
        
        // Set title of navigation bar title
        navigationItem.title = "Home"
        
        // Setup menu bar
        setupMenuBar()
        
        // Set title bar color
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 48, green: 120, blue: 49, alpha: 1)
        
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
        hideView.backgroundColor = UIColor.rgb(red: 48, green: 120, blue: 49, alpha: 1)
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
        view.backgroundColor = UIColor.rgb(red: 58, green: 153, blue: 68, alpha: 0.5)
        // Setup the size of each collectionView cell
        return CGSize(width: view.frame.width, height: 200)
    
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
