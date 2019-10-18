//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 勝見真幸 on 2019/10/08.
//  Copyright © 2019 jp.techacademy.masayuki.katsumi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    //タイマー用時間のための配列。
    var timer_sec: Float = 0
    var timer :Timer!
    var value: Int = 1
    //UIImageの配列
    var sightImage = ["image1": UIImage(named: "path-4518094_1280.jpg"), "image2": UIImage(named: "landscape-4518195_1280.jpg"), "image3": UIImage(named: "volcano-4493461_1280.jpg")]
    //画像UIImageView
    @IBOutlet weak var imageView: UIImageView!
    //画像をtapして画面を遷移
    @IBAction func tapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "KakudaiViewController", sender: nil)
        self.timer.invalidate()
    }
    //画面を元に戻す遷移
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = sightImage["image\(value)"]
        imageView.image = image as? UIImage
    }
    @objc func updateTimer(_ timer: Timer) {
        if value >= 3 {
            value = 1
            let image = sightImage ["image\(value)"]
            imageView.image = image as? UIImage
        } else {
            value += 1
            let image = sightImage ["image\(value)"]
            imageView.image = image as? UIImage
        }
    }
    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のResultViewControllerを取得する
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        //遷移先のKakudaiViewControllerで宣言しているbigimageに値を代入して渡す
        kakudaiViewController.bigimage = sightImage["image\(value)"]!
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            let button = goAndPause!
            button.setTitle("再生", for: .normal)
            //進むボタンをタップ可能にする
            Advance.isEnabled = true
            //停止ボタンをタップ可能にする
            back.isEnabled = true
        }
    }
    
    //進むボタン
    @IBOutlet weak var Advance: UIButton!
    
    @IBAction func Advance(_ sender: Any) {
        if value >= 3 {
            value = 1
            let image = sightImage ["image\(value)"]
            imageView.image = image as? UIImage
        } else {
            value += 1
            let image = sightImage ["image\(value)"]
            imageView.image = image as? UIImage
        }
    }
    //戻るボタン
    @IBOutlet weak var back: UIButton!
    @IBAction func back(_ sender: Any) {
        if value <= 1 {
            value = 3
            let image = sightImage ["image\(value)"]
            imageView.image = image as? UIImage
        } else{
            value -= 1
            let image = sightImage ["image\(value)"]
            imageView.image = image as? UIImage
        }
    }
    //再生・停止ボタン
    
    @IBOutlet weak var goAndPause: UIButton!
    @IBAction func goAndPause(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //ボタンを停止ボタンに変更する
            let button = sender as! UIButton
            button.setTitle("停止", for: .normal)
            //進むボタンをタップ不可にする
            Advance.isEnabled = false
            //停止ボタンをタップ不可にする
            back.isEnabled = false
        } else {
            //値があればタイマー停止
            self.timer.invalidate() //タイマーを停止
            self.timer = nil
            let button = sender as! UIButton
            button.setTitle("再生", for: .normal)
            //進むボタンをタップ可能にする
            Advance.isEnabled = true
            //停止ボタンをタップ可能にする
            back.isEnabled = true
        }
    }
}
