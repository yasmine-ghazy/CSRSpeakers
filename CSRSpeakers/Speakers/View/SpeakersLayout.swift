//
//  SpeakersLayout.swift
//  CSRSpeakers
//
//  Created by apple on 8/5/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import SnapKit

class SpeakersLayout: BaseLayout {

    lazy var containerview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    

    override init(superview: UIView) {
        super.init(superview: superview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupViews(){
        
        //Add views
        superview.addSubview(containerview)
        
        self.containerview.addSubview(collectionView)
        
        containerview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(containerview)
        }
    }
    
    
    
}
