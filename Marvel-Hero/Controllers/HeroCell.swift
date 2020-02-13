//
//  HeroCell.swift
//  Marvel-Hero
//
//  Created by Work on 2/10/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import UIKit

class HeroCell: UICollectionViewCell {
    
    var url : String?
    var id : Int?
    var name = "Name : "
    
    @IBOutlet weak var heroAvatarImg: UIImageView!
    @IBOutlet weak var heroNameLbl: UILabel!
    @IBOutlet weak var favBtnClicked: UIButton!
    
    
    
    private var task: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        task?.cancel()
        task = nil
        heroAvatarImg.image = UIImage.init(named: "Marvel")
    }
    
    
    func configureWith(urlString: String , name : String , id : Int) {
        if task == nil {
            
            heroNameLbl.text = name
            self.name = name
            self.id = id
            self.url = urlString
            task = heroAvatarImg.downloadImage(from: urlString)
            
//            if urlString == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"{
//
//               heroAvatarImg.image = UIImage.init(named: "Marvel")
//
//            }else{
//                task = heroAvatarImg.downloadImage(from: urlString)
//            }

            
        }
    }
    
    
    
    override func awakeFromNib() {
       
    
        super.awakeFromNib()
        // Initialization code
    }

}
