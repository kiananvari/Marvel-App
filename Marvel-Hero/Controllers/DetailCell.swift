//
//  DetailCell.swift
//  Marvel-Hero
//
//  Created by Work on 2/11/20.
//  Copyright © 2020 Kian Anvari. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var DetailImageView: UIImageView!
    @IBOutlet weak var NameTextLbl: UILabel!
    @IBOutlet weak var DesTextLbl: UILabel!
    
    
    private var task: URLSessionDataTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        task?.cancel()
        task = nil
        DetailImageView.image = UIImage.init(named: "Marvel")
    }
    
    
    func configureWith(urlString: String? , name : String? , description : String?) {
        if task == nil {
            
            NameTextLbl.text = "\(name!)"
            if let description = description {
                 DesTextLbl.text = "\(description)"
            }
            
            if let avatar = urlString {
                task = DetailImageView.downloadImage(from: avatar)
            }
           
            
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
