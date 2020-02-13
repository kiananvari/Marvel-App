//
//  MainController.swift
//  Marvel-Hero
//
//  Created by Work on 2/10/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController {
    
    var offset = 0
    var limit = 14
    var is_finished = false
    var is_waiting = Bool()
    var myCharsArray = [Result]()
    var myResCount = 0
    let MyCollectionViewCellId: String = "HeroCell"
    var favListArray:NSMutableArray = []
    let activityView = UIActivityIndicatorView(style: .whiteLarge)
    
    
    //numberOfSections
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //numberOfItemsInSection
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCharsArray.count
    }

    //cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! HeroCell
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
                let pathUrl = self.myCharsArray[indexPath.row].thumbnail?.path
                let pathExt = self.myCharsArray[indexPath.row].thumbnail?.thumbnailExtension
                let avatarUrl = "\(pathUrl!).\(pathExt!)"

        cell.configureWith(urlString: "\(avatarUrl)", name: self.myCharsArray[indexPath.row].name! , id : self.myCharsArray[indexPath.row].id!)
        
                var hero = ["id" : 0 , "name" : "" , "url" : ""] as [String : Any]
                hero["id"] = cell.id
                hero["name"] = cell.name
                hero["url"] = cell.url
      
                if favListArray.contains(hero) {

                    cell.favBtnClicked.setImage(UIImage.init(named: "filled"), for: UIControl.State.normal)

                }else{

                    cell.favBtnClicked.setImage(UIImage.init(named: "star"), for: UIControl.State.normal)
                }

                cell.favBtnClicked.tag = indexPath.row

                cell.favBtnClicked.addTarget(self, action:#selector(addToFav) , for: UIControl.Event.touchUpInside)

        
        
        return cell
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
    
    
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == myCharsArray.count - 1 ){
            print("loading")
            
            if(self.is_finished == false){
                
               activityView.color = .white
               showDownloading()
                
                ApiHandler.getCharacters(offset: offset, limit: limit) { (results) in
                    
                    if ((results.data?.count)! < self.limit) {
                        self.is_finished = true
                    }
                    
                    for item in results.data!.results {
                        
                        self.myCharsArray.append(item)
                        print("my final array count is : \(self.myCharsArray.count)")
                    }
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    self.hideDownloading()
                    
                    self.offset += self.limit
                    
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let detailVC = DetailController()
        detailVC.heroId = myCharsArray[indexPath.row].id!
        detailVC.heroName = myCharsArray[indexPath.row].name!
        
        navigationController?.pushViewController(detailVC, animated: true)
       
            self.activityView.isHidden = true
        

    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "favorites") != nil {
            
            favListArray = NSMutableArray.init(array: UserDefaults.standard.object(forKey: "favorites") as! NSArray).mutableCopy() as! NSMutableArray
            
        }
        
        collectionView.reloadData()
//        print(favListArray)
        
    }
    
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        fetchContent()
        print("loadd")
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
        collectionView.backgroundColor = UIColor.red.withAlphaComponent(0.4)
        
        self.title  = "MARVEL"
        let search = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        let favorite = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(favoriteTapped))

        navigationItem.rightBarButtonItems = [search]
        navigationItem.leftBarButtonItems = [favorite]
       
    }
    
    func showDownloading(){
        activityView.style = UIActivityIndicatorView.Style.whiteLarge
        activityView.color = .white
        activityView.hidesWhenStopped = true
        activityView.center = self.view.center
        self.view.addSubview(activityView)
         activityView.alpha = 1
        activityView.startAnimating()
        
    }
    func hideDownloading() {
        DispatchQueue.main.async {
            self.activityView.alpha = 0
        }
    }
  

    func fetchContent(){
       
        if (myCharsArray.count == 0){
            showDownloading()
            ApiHandler.getCharacters(offset: offset, limit: limit) { (result) in
                
                for item in result.data!.results {
                    
                    self.myCharsArray.append(item)
                    
                }
                print("my final array count is : \(self.myCharsArray.count)")
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                self.offset += self.limit
                self.myResCount = self.myCharsArray.count
                self.is_waiting = false
                DispatchQueue.main.sync {
                self.hideDownloading()
                }
            }
            
        }
        
        
    }
    
    @objc func searchTapped(){
        
        let searchVC = SearchController()
        navigationController?.pushViewController(searchVC, animated: true)
        
        
    }
    
    @objc func favoriteTapped(){
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = CGFloat(10)
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 200)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 12, bottom: 5, right: 12)
        
      
        let favoriteVC = FavoriteController(collectionViewLayout: flowLayout)
        
        
        navigationController?.pushViewController(favoriteVC, animated: true)
        
        
    }
    
    
    
}
