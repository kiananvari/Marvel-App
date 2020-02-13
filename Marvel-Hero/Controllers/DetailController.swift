//
//  DetailController.swift
//  Marvel-Hero
//
//  Created by Work on 2/11/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import UIKit

class DetailController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
        var favListArray:NSMutableArray = []
        var activityView = UIActivityIndicatorView()
        var avatarImageViewer = UIImageView()
        var segmentController = UISegmentedControl.init(items: ["Stories" ,"Series" , "Events" ,"Comics"])
        var tableView = UITableView()
        var heroId = 0
        var myHero = [Result]()
        var heroCo = [ResultCo]();var heroSt = [ResultSt]();var heroSe = [ResultSe]();var heroEv = [ResultEv]()
        var heroName = ""
        var avatarUrl = ""
    
        var flag = 0
        var is_fav = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch flag {
        case 0:
              return heroSt.count
        case 1:
              return heroSe.count
        case 2:
              return heroEv.count
        case 3:
              return heroCo.count
        default:
            print("default")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("DetailCell", owner: self, options: nil)?.last as! DetailCell
        

        switch flag {
        case 0:
           
            let pathUrl = self.heroSt[indexPath.row].thumbnail?.path
            let pathExt = self.heroSt[indexPath.row].thumbnail?.thumbnailExtension
            if let pathUrl = pathUrl {
                     let avatarUrl = "\(pathUrl).\(pathExt!)"
                        cell.configureWith(urlString: avatarUrl, name: heroSt[indexPath.row].title!, description: heroSt[indexPath.row].resultDescription)
            }
            cell.configureWith(urlString: "", name: heroSt[indexPath.row].title!, description: heroSt[indexPath.row].resultDescription)
            
            break
            
        case 1:
        
            let pathUrl = self.heroSe[indexPath.row].thumbnail?.path
            let pathExt = self.heroSe[indexPath.row].thumbnail?.thumbnailExtension
            if let pathUrl = pathUrl {
                let avatarUrl = "\(pathUrl).\(pathExt!)"
                cell.configureWith(urlString: avatarUrl, name: heroSe[indexPath.row].title!, description: heroSe[indexPath.row].resultDescription)
            }
            cell.configureWith(urlString: "", name: heroSe[indexPath.row].title!, description: heroSe[indexPath.row].resultDescription)
            
            
            break
        case 2:
            
            let pathUrl = self.heroEv[indexPath.row].thumbnail?.path
            let pathExt = self.heroEv[indexPath.row].thumbnail?.thumbnailExtension
            if let pathUrl = pathUrl {
                let avatarUrl = "\(pathUrl).\(pathExt!)"
                cell.configureWith(urlString: avatarUrl, name: heroEv[indexPath.row].title!, description: heroEv[indexPath.row].resultDescription)
            }
            cell.configureWith(urlString: "", name: heroEv[indexPath.row].title!, description: heroEv[indexPath.row].resultDescription)
            
            
            break
        case 3:
            
            let pathUrl = self.heroCo[indexPath.row].thumbnail?.path
            let pathExt = self.heroCo[indexPath.row].thumbnail?.thumbnailExtension
            if let pathUrl = pathUrl {
                let avatarUrl = "\(pathUrl).\(pathExt!)"
                cell.configureWith(urlString: avatarUrl, name: heroCo[indexPath.row].title!, description: heroCo[indexPath.row].resultDescription)
            }
            cell.configureWith(urlString: "", name: heroCo[indexPath.row].title!, description: heroCo[indexPath.row].resultDescription)
            
            
            break
        default:
            print("default")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = heroName
        self.view.backgroundColor = UIColor.red.withAlphaComponent(1)
        getStories()
        showDownloading()
        SearchModel.getResultListById(heroId: heroId) { (result) in
            
            self.myHero = (result.data?.results)!
            DispatchQueue.main.async {
                self.showAvatar()
            }
           

        }
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        

        setAvatarImageViewer()
        setsegmentController()
        settableView()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func getStories(){
        
        if (heroSt.count == 0) {
            ApiHandler.getStories(heroId: heroId, offset: 0, limit: 10) { (result) in
                if result.data.count != 0 {
                    
                    for item in result.data.results {
                        
                        self.heroSt.append(item)
                        
                    }
                }
                
                    DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                self.hideDownloading()
            }
            
        }else{
            self.hideDownloading()
        }
        
    }
    
    func getSeries(){
        
        if (heroSe.count == 0 ){
            
            ApiHandler.getSeries(heroId: heroId, offset: 0, limit: 10) { (result) in
                if result.data.count != 0 {
                    //                print(result.data.results[0].title)
                    for item in result.data.results {
                        
                        self.heroSe.append(item)
                        
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                 self.hideDownloading()
            }
        }else{
             self.hideDownloading()
        }
       
    }
    
    
    func getEvents(){
        
        if (heroEv.count == 0){
            
            ApiHandler.getEvents(heroId: heroId, offset: 0, limit: 10) { (result) in
                
                if result.data.count != 0 {
                    //                            print(result.data.results[0].start)
                    for item in result.data.results {
                        
                        self.heroEv.append(item)
                        
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                self.hideDownloading()
            }
            
        }else{
             self.hideDownloading()
        }
        
    }
    

    func getComics(){
        
        if (heroCo.count == 0){
            
            ApiHandler.getComics(heroId: heroId, offset: 0, limit: 10) { (result) in
                
                if result.data.count != 0 {
                    //            print(result.data.results[0].resultDescription)
                    for item in result.data.results {
                        
                        self.heroCo.append(item)
                        
                    }
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                self.hideDownloading()
            }
          
        }else{
             self.hideDownloading()
        }
        
    }
    

    
    func showAvatar(){
        
        let pathUrl = self.myHero[0].thumbnail?.path
        let pathExt = self.myHero[0].thumbnail?.thumbnailExtension
         avatarUrl = "\(pathUrl!).\(pathExt!)"
        
        avatarImageViewer.downloadImage(from: avatarUrl)
        
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        showDownloading()
        switch sender.selectedSegmentIndex{
        case 0:
            print("Stories");
            getStories()
            flag = 0
            self.tableView.reloadData()
            break
        case 1:
            print("Series")
            getSeries()
            flag = 1
            self.tableView.reloadData()
            break
        case 2:
            print("Events");
            getEvents()
            flag = 2
            self.tableView.reloadData()
            break
        case 3:
            print("Comics")
            getComics()
            flag = 3
            self.tableView.reloadData()
            break
        default:
            break
        }
    }
    
    @objc func favTapped(){
        
    
        if (is_fav) {
            
            for item in favListArray{
                
                var curr = item as! [String:Any]
                
                if (curr["id"] as! Int == heroId) {
                    favListArray.remove(curr)
                }
                let barButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(favTapped))
                self.navigationItem.setRightBarButton(barButton, animated: true)
            }
            
            
        }else{
            
            var hero = ["id" : heroId , "name" : heroName , "url" : avatarUrl] as [String : Any]
            
//            print(hero)
            favListArray.add(hero)
            let barButton = UIBarButtonItem.init(barButtonSystemItem: .stop, target: self, action: #selector(favTapped))
            self.navigationItem.setRightBarButton(barButton, animated: true)
        }
        
        UserDefaults.standard.set(favListArray, forKey: "favorites")
        
        print("hellp")
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDefaults.standard.object(forKey: "favorites") != nil {
            
            favListArray = NSMutableArray.init(array: UserDefaults.standard.object(forKey: "favorites") as! NSArray).mutableCopy() as! NSMutableArray
//            print(favListArray)
            
            
        }
        
        for item in favListArray{
            
            var curr = item as! [String:Any]
           
            if (curr["id"] as! Int == heroId) {
                is_fav = true
                print(is_fav)
            }
            
        }
        
        if(is_fav){
            let barButton = UIBarButtonItem.init(barButtonSystemItem: .stop, target: self, action: #selector(favTapped))
            self.navigationItem.setRightBarButton(barButton, animated: true)
        }else{

            let barButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(favTapped))
            self.navigationItem.setRightBarButton(barButton, animated: true)
        }
       
     
        
    }
    
    
    func setAvatarImageViewer(){

        //        avatarImageViewer.image = UIImage.init(named: "Marvel")
        avatarImageViewer.frame = CGRect.init(x: self.view.frame.width/2 - 100, y: 100, width: 200, height: 200)
        avatarImageViewer.layer.cornerRadius = 25
        avatarImageViewer.layer.masksToBounds = true
        avatarImageViewer.contentMode = .scaleAspectFill
        view.addSubview(avatarImageViewer)
    }

    func setsegmentController(){

        segmentController.frame = CGRect(x: 40 , y: self.avatarImageViewer.frame.size.height + 140 , width: 300, height: 30)

        segmentController.selectedSegmentIndex = 0
        segmentController.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)

        segmentController.layer.cornerRadius = 5.0
        segmentController.backgroundColor = .red
        segmentController.tintColor = .white

        view.addSubview(segmentController)

    }


    func settableView(){

        tableView.frame = CGRect.init(x: 8, y: 400, width: 360 , height: 430)
        view.addSubview(tableView)

    }
    
    func showDownloading(){
        
        activityView.color = .red
        activityView.hidesWhenStopped = true
        self.tableView.addSubview(activityView)
        tableView.backgroundView = activityView
        activityView.alpha = 1
        activityView.startAnimating()
        
    }
    
    func hideDownloading() {
        DispatchQueue.main.async {
            self.activityView.alpha = 0
        }
    }
    
}
