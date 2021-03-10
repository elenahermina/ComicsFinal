//
//  UIImageViewExtension.swift
//  ComicsFinal
//
//  Created by elena hermina barbullushi on 10.03.21.
//

import UIKit
import Foundation


extension UIImageView {
    func load(urlString : String) {
           guard let url = URL(string: urlString)else {
               return
           }
           DispatchQueue.global().async { [weak self] in
               if let data = try? Data(contentsOf: url) {
                   if let image = UIImage(data: data) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
   }
