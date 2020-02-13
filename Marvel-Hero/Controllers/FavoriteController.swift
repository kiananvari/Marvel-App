//
//  FavoriteController.swift
//  Marvel-Hero
//
//  Created by Work on 2/12/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//
//


import UIKit

class FavoriteController: UICollectionViewController {
    let MyCollectionViewCellId: String = "HeroCell"
    var favListArray:NSMutableArray = []

    var hero = [[String : Any]]()

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return hero.count
    }



    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! HeroCell
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
//        print(hero[indexPath.row])
  
        let avatarUrl = hero[indexPath.row]["url"]

        cell.configureWith(urlString: "\(avatarUrl!)", name: hero[indexPath.row]["name"] as! String , id : hero[indexPath.row]["id"] as! Int)

        if favListArray.contains(hero[indexPath.row]) {
            
            cell.favBtnClicked.setImage(UIImage.init(named: "filled"), for: UIControl.State.normal)
            
        }else{
            
            cell.favBtnClicked.setImage(UIImage.init(named: "star"), for: UIControl.State.normal)
        }
        
        cell.favBtnClicked.tag = indexPath.row
        
        cell.favBtnClicked.addTarget(self, action:#selector(addToFav) , for: UIControl.Event.touchUpInside)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailController()
        detailVC.heroId = hero[indexPath.row]["id"] as! Int
        detailVC.heroName = hero[indexPath.row]["name"] as! String
        
        navigationController?.pushViewController(detailVC, animated: true)
    
        
    }
    
    @objc func addToFav(sender:UIButton) {
        
        let cell = self.collectionView.cellForItem(at: IndexPath.init(row: sender.tag, section: 0)) as! HeroCell
        
        var hero = ["id" : 0 , "name" : "" , "url" : ""] as [String : Any]
        hero["id"] = cell.id
        hero["name"] = cell.name
        hero["url"] = cell.url
        
        if favListArray.contains(hero) {
            
            favListArray.remove(hero)
            
        }else{
            
            favListArray.add(hero)
        }
        
        collectionView.reloadData()
        
        UserDefaults.standard.set(favListArray, forKey: "favorites")
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.gray.withAlphaComponent(1)
        self.title  = "Favorites"
        self.view.addSubview(collectionView)


    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        hero.removeAll()

        if UserDefaults.standard.object(forKey: "favorites") != nil {

            favListArray = NSMutableArray.init(array: UserDefaults.standard.object(forKey: "favorites") as! NSArray).mutableCopy() as! NSMutableArray
            print(favListArray)
            
            
            self.collectionView.reloadData()

        }
        
        for item in favListArray {
            
            hero.append(item as! [String : Any])
            
        }

    }



}
