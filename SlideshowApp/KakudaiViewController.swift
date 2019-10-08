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
     //var sightImage = ["image1": UIImage(named: "path-4518094_1280.jpg"), "image2": UIImage(named: "landscape-4518195_1280.jpg"), "image3": UIImage(named: "volcano-44933461_1280.jpg")]
    
    //bigimageの初期値
    var bigimage = UIImage(named: "path-4518094_1280.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //イメージを出力
        imageView.image = bigimage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
