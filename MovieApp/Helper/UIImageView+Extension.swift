//
//  UIImageView+Extension.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 02.10.25.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(path: String) {
        let url = URL(string: NetworkingHelper.shared.configureImageURL(path: path))
        kf.setImage(with: url)
    }
}
