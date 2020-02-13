//
//  uiImageView + Downloader.swift
//  ImageDownloader
//
//  Created by Work on 4/19/19.
//  Copyright © 2019 Kian Anvari. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func downloadImage(from imgURL: String) -> URLSessionDataTask? {
        guard let url = URL(string: imgURL) else { return nil }
        
        // set initial image to nil so it doesn't use the image from a reused cell
        image = nil
        
        // check if the image is already in the cache
        if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
            self.image = imageToCache
            return nil
        }
        
        // download the image asynchronously
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err)
                return
            }
            
            DispatchQueue.main.async {
                // create UIImage
                let imageToCache = UIImage(data: data!)
                // add image to cache
                imageCache.setObject(imageToCache!, forKey: imgURL as NSString)
                self.image = imageToCache
            }
        }
        task.resume()
        return task
    }
}

//extension UIImageView {
//
//
//    func downloadFromUrl (url : URL){
//
//        DispatchQueue.global(qos: .background).async{
//
//            do {
//
//                let myData = try Data.init(contentsOf: url)
//
//                let myimage = UIImage.init(data: myData)
//
//                DispatchQueue.main.async {
//                   self.image = myimage
//                }
//
//            } catch let error {
//
//                print(error)
//
//            }
//        }
//
//    }
//}
