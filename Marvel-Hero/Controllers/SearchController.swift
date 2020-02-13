//
//  SearchController.swift
//  Marvel-Hero
//
//  Created by Work on 2/12/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import UIKit

class SearchController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate{
    
    
    let mainSearchBar = MainSearchBar()
    let cellId = "cellId"
    var tempArray = [String]()
    var myHeroes = [Result]()
    var filteredArray = [String]()
    var isSearching = false
    var activityView = UIActivityIndicatorView()
    var name = ""
    
    
    lazy var mainTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return table
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = mainTable.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        cell.textLabel?.text = myHeroes[indexPath.row].name
        return cell
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if name != "" {
            showDownloading()
        }else if name == ""
        {
            myHeroes.removeAll()
            self.mainTable.reloadData()
            hideDownloading()
        }
        
        self.fillArray(name: name)
        myHeroes.removeAll()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        name = searchText
        
        if searchText != "" {
            showDownloading()
        }else if searchText == ""
        {
            myHeroes.removeAll()
            self.mainTable.reloadData()
            hideDownloading()
        }
        
        self.fillArray(name: searchText)
        myHeroes.removeAll()
        
    }
    
    
    func fillArray(name : String){
        showDownloading()
        
        if name != "" {
            SearchModel.getResultListByName(name: "\(name)") { (result) in
                
                if (result.data?.results.count)! > 0 {
                    
                    for item in result.data!.results {
                        
                        
                        self.myHeroes.append(item)
                        
                    }
                    DispatchQueue.main.async {
                        self.mainTable.reloadData()
                    }
                    
                }
                
                self.hideDownloading()
                
            }
        }
        
  
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print(myHeroes[indexPath.row].name!)
        let detailVC = DetailController()
        detailVC.heroId = myHeroes[indexPath.row].id!
        detailVC.heroName = myHeroes[indexPath.row].name!

        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }

    
    
    override func viewDidLoad() {

        setupView()
    
        mainTable.delegate = self
        mainTable.dataSource = self
        mainSearchBar.delegate = self
        mainSearchBar.returnKeyType = UIReturnKeyType.done
        
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        self.view.backgroundColor = .red
        super.viewDidLoad()

    }
    
    func setupView(){
        
        view.addSubview(mainSearchBar)
        view.addSubview(mainTable)
        
        mainSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainSearchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mainSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        mainTable.topAnchor.constraint(equalTo: mainSearchBar.bottomAnchor, constant: 0).isActive = true
        mainTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func showDownloading(){
        activityView.color = .black
        activityView.hidesWhenStopped = true
        activityView.center = self.view.center
        let barButton = UIBarButtonItem(customView: activityView)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        activityView.alpha = 1
        activityView.startAnimating()
        
    }
    func hideDownloading() {
        DispatchQueue.main.async {
            self.activityView.alpha = 0
        }
    }
    


}
