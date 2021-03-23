//
//  ViewController.swift
//  Joke App
//
//  Created by Naveen on 22/03/21.
//

import UIKit
var val : String = ""
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView?
    var jokesManager = JokesManager()
    
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
        JokeButton.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)
        jokesManager.delegate = self
    }
    @objc func editButtonTapped() {
        DispatchQueue.main.async {
            self.jokesManager.fetchAPI(category: self.jokesManager.getCategoryName(CategoryName: val ))
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        jokesManager.Category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.labeld.text = jokesManager.Category[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let Category = jokesManager.Category[indexPath.row]
        val = jokesManager.Category[indexPath.row]
        let CategoryString = jokesManager.getCategoryName(CategoryName: Category)
        jokesManager.fetchAPI(category: CategoryString)
        contentLabel.text = "Selected Category : \(Category)"
    
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
        JokeView.text = "Select a Category to Disaply Jokes"
        JokeView.textContainerInset = UIEdgeInsets(top: 70, left: 30, bottom:  70, right: 30)
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

extension ViewController : JokesManagerDelegate{
    func didUpdateJokes(JokesPassed: JokeModel) {
        DispatchQueue.main.async {
            self.JokeTextView.text = JokesPassed.Name
        }
    }
}
