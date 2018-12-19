//
//  SpeakerCollectionViewCell.swift
//  CSRSpeakers
//
//  Created by apple on 8/6/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class SpeakerCell: UICollectionViewCell {
    //MARK: - Properties
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor.blue
        return iv
    }()
    
    var nameLbl: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.contentMode = .scaleAspectFill
        label.text = "Yasmine"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var titleLbl: UILabel = {
        
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    var image: String?{
        didSet{
            if let photoURL = image{
                let imageURL = URL(string: photoURL)
                let imageData = try! Data(contentsOf: imageURL!)
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
 
    
    func setCell(speaker: SpeakerEntity){
        self.nameLbl.text = speaker.name
        self.titleLbl.text = speaker.title
        self.image = speaker.imageUrl
       // self.setupViews()
       // self.setConstraints()
    }
    
    func setupViews(){
        self.addSubview(imageView)
        self.addSubview(nameLbl)
        self.addSubview(titleLbl)
    }
    
    func setConstraints(){
  
        titleLbl.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(titleLbl.snp.top).offset(0)
        }
        nameLbl.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(imageView).inset(5)
            make.height.equalTo(50)
        }
    }
    
}
