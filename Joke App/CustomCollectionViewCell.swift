//
//  CustomCollectionViewCell.swift
//  Joke App
//
//  Created by Naveen on 23/03/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    
    let labeld : UILabel = {
        let labels = UILabel()
        labels.font = UIFont(name: "HelveticaNeue", size: 15)
        labels.textColor = .black
        labels.backgroundColor = .white
        labels.textAlignment = .center
        labels.layer.cornerRadius = 6
        labels.layer.masksToBounds = true
        return labels
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(labeld)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        labeld.frame = CGRect(x: 1, y: contentView.frame.size.height/70, width: contentView.frame.size.width, height: 30)
    }
    override var isSelected: Bool {
        didSet{
            labeld.backgroundColor = isSelected ?UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00) : UIColor.white
        }
    }
}
