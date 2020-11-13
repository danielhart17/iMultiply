//
//  GameViewController.swift
//  iMultiply
//
//  Created by Daniel Hart on 11/11/20.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func PauseButtonClicked(_ sender: Any) {
        
    }
    
    /*let skView: SKView = {
        let view = SKView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()*/
    var count = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set collection view attributes
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        
        let width = (ScreenSize.width - layout.minimumInteritemSpacing*2)/3
        
        layout.itemSize.width = width
        layout.itemSize.height = width
        
        //set timeLabel to the time set in the settings
        
        timeLabel.textColor = UIColor.green
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)

        /*view.addSubview(skView)
        
        skView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        skView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        skView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        let scene = StartMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true*/
        
        
    }
    
    @objc func countDown() {
        timeLabel.text = String(count)
        if (count<21) {
            timeLabel.textColor = UIColor.yellow
        }
        if (count<11) {
            timeLabel.textColor = UIColor.orange
        }
        if (count<6) {
            timeLabel.textColor = UIColor.red
        }
        if (count == 0) {
            return
        }
        count-=1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // dispose of resources that can be recreated
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultiplicationCell", for: indexPath) as! GameViewCell
        
        
        
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        
        cell.firstNum.text = String(Int.random(in: 1..<11))
        cell.secondNum.text = String(Int.random(in: 1..<11))
        
        return cell
    }
    
}
