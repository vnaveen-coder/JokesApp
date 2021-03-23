//
//  MyCollectionViewCell.swift
//  Joke App
//
//  Created by Naveen on 22/03/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    var value : Int?
    static func nib() -> UINib {
          return UINib(nibName: "MyCollectionViewCell", bundle: nil)
      }
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(labeld)
    }
    
    let labeld : UILabel = {
        let labels = UILabel()
        labels.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        labels.text = "Yellow"
        labels.textColor = .black
        labels.backgroundColor = .white
        labels.translatesAutoresizingMaskIntoConstraints = false
        return labels
    }()
    
    override var isSelected: Bool {
        didSet{
            labeld.backgroundColor = isSelected ?UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00) : UIColor.white
        }
    }
    
}
