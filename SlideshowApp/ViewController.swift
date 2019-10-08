//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 勝見真幸 on 2019/10/08.
//  Copyright © 2019 jp.techacademy.masayuki.katsumi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var sightImage = ["image1": UIImage(named: "path-4518094_1280.jpg"), "image2": UIImage(named: "landscape-4518195_1280.jpg"), "image3": UIImage(named: "volcano-44933461_1280.jpg")]
    
    //画像UIImageView
    @IBOutlet weak var imageView: UIImageView!
    //画像をtapして画面を遷移
    @IBAction func tapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "KakudaiViewController", sender: nil)
    }
    //画面を元に戻す遷移
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //imageViewにイメージを代入
        let image = sightImage["image1"]
        //imageViewにimageを入れて表示
        imageView.image = image as? UIImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のResultViewControllerを取得する
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        //遷移先のKakudaiViewControllerで宣言しているbigimageに値を代入して渡す
        kakudaiViewController.bigimage = sightImage["image2"]!
 
        
    }


}

