//
//  UIKit+Extention.swift
//  FLNews
//
//  Created by 凤梨 on 2019/4/12.
//  Copyright © 2019年 2dfire. All rights reserved.
//

import UIKit

protocol StoryboardLoadable {
}

extension StoryboardLoadable where Self:UIViewController {
    static func loadStoryboard() -> Self {
        return UIStoryboard(name: "\(self)", bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
    }
}

protocol NibLoadable {
}
extension NibLoadable {
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}
