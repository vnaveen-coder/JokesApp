//
//  ViewController.swift
//  Joke App
//
//  Created by Naveen on 22/03/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView?
    var jokesManager = JokesManager()
    let Category : [String] = ["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: view.frame.width/5, height: 40)
        collectionView = UICollectionView(frame: CGRect(x: 10, y: 150, width: view.frame.width-20, height: 180), collectionViewLayout: layout)
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView?.backgroundColor = .gray
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(titlelabel)
        view.addSubview(collectionView!)
        view.addSubview(contentLabel)
        view.addSubview(JokeTextView)
        view.addSubview(JokeButton)
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.labeld.text = Category[indexPath.row]
        return cell
    }
    let titlelabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 12, y: 110, width: 400, height: 30))
        label.text = "Chuck Norries"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let contentLabel : UILabel = {
        let clabel = UILabel(frame: CGRect(x: 100, y: 400, width: 400, height: 30))
        clabel.text = "Selected Category : Food"
        clabel.textColor = .black
        clabel.font = UIFont(name: "HelveticaNeue", size: 16)
        clabel.translatesAutoresizingMaskIntoConstraints = false
        return clabel
    }()
    let JokeTextView: UITextView = {
        let JokeView = UITextView(frame: CGRect(x: 10, y: 430, width: 370, height: 250))
        JokeView.text = "Chuck Norris once rode a bull, and nine months later it had a calf."
        JokeView.textContainerInset = UIEdgeInsets(top: 100, left: 30, bottom:  50, right: 30)
        JokeView.textColor = .white
        JokeView.backgroundColor = .link
        JokeView.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        JokeView.translatesAutoresizingMaskIntoConstraints = false
        return JokeView
    }()
    let JokeButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 700, width: 400, height: 30))
        button.setTitle("New Joke", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
}

