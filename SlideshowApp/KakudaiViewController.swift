//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by 勝見真幸 on 2019/10/08.
//  Copyright © 2019 jp.techacademy.masayuki.katsumi. All rights reserved.
//

import UIKit

class KakudaiViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var bigimage = UIImage(named: "path-4518094_1280.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = bigimage
    }
}
