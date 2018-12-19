//
//  ViewController.swift
//  CSRSpeakers
//
//  Created by apple on 8/5/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class SpeakersVC: UIViewController{

    // MARK: - Properties
    let speakerCellId = "speakerCellId"
    let cellMarginSize = 10
    let estimateWidth = 150 //100
    let estimateHight = 200
    var layout: SpeakersLayout!
    var speakersArr: [SpeakerEntity] = []
    var speakersLayout: SpeakersLayout!
    var speakersPresenter: SpeakersPresenter!
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Customize Navbar
        title = "Speakers"
        
        // initialize layout
        speakersLayout = SpeakersLayout(superview: self.view)
        speakersLayout.setupViews()
        
        // initialize gateway
        let homeGateway = HomeGateway()
        speakersPresenter = SpeakersPresenter(homeGateway: homeGateway)

        //Set Delegates
        speakersLayout.collectionView.delegate = self
        speakersLayout.collectionView.dataSource = self
        speakersPresenter.setView(view: self)
       
        //Register
        speakersLayout.collectionView.register(SpeakerCell.self, forCellWithReuseIdentifier: speakerCellId)
        
        // getData
      //  speakersArr = [placeholder, placeholder, placeholder]
        speakersPresenter.getSpeakers()
    }

}

// MARK: UICollectionViewDataSource
extension SpeakersVC: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return speakersArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: speakerCellId, for: indexPath) as! SpeakerCell
        
        // Configure the cell
        if !(speakersArr.isEmpty){
            let speaker = speakersArr[indexPath.row]
            cell.setCell(speaker: speaker)
        }
        return cell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension SpeakersVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let itemWidth = calculateWidth()
       // let itemHeight = CGFloat(estimateHight)
        let itemHeight = itemWidth * 1.5
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = CGFloat(cellMarginSize)
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func calculateWidth()-> CGFloat{
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize)*(cellCount-1)-margin)/cellCount
        return width
    }
    
    func setupCollectionView(){
        
        let flow = layout.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(cellMarginSize)
        flow.minimumLineSpacing = CGFloat(cellMarginSize)
    }
    
}

extension SpeakersVC : SpeakersView{
    func showLoading() {

    }
    
    func hideLoading() {
        
    }
    
    func showLoadError(message: String) {
        
    }
    
    func showLoginError(message: String) {
        
    }
    
    func showNoInternetConnectionError() {
        
    }
    
    func showSpeakersData(response: SpeakersResponse) {
        print(response.data[1].name)
        speakersArr = response.data
        speakersLayout.collectionView.reloadData()
    }
    
    
}
