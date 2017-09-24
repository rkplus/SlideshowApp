//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Ratnesh Kumar on 2017/09/21.
//  Copyright © 2017年 ratonesshu_kuma_ru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var slideShowButton: UIButton!
    
    //画像の名前の配列
    let imageNameArray = [
        "dog1.jpeg",
        "dog2.jpg",
        "dog3.jpg",
        ]
    
    @IBAction func Prev(_ sender: Any) {
        //表示している番号を1減らす
            dispImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
            displayImage()
    }
    
    @IBAction func Next(_ sender: Any) {
            //表示している番号を1増やす
            dispImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
    }

    
    //タイマー用の変数
    var timer:Timer!
    
    //表示している画像の番号
    var dispImageNo = 0
    
    //表示している画像の番号を元に画像を表示する
    func displayImage(){
        
        //画像の番号が正常な範囲を示しているかチェック
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0{
            dispImageNo = imageNameArray.count - 1
        }

        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > imageNameArray.count - 1{
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像を読み込み
        let image = UIImage(named:name)
        
        //Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //バンドルした画像ファイルを読み込む
        let image = UIImage(named: "dog1.jpeg")
        
        // image Viewに画像を設定
        imageView.image = image
        
            slideShowButton.setTitle("再生", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slideShow(_ sender: Any) {
        //再生訂正ボタンを押すと、スライドショーの再生・停止
        
        if timer != nil {
            //タイマーを破棄する
            timer.invalidate()
            timer = nil
            prevButton.isEnabled = true
            nextButton.isEnabled = true
            slideShowButton.setTitle("再生", for: .normal)

        }
        else{
            self.timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            prevButton.isEnabled = false
            nextButton.isEnabled = false
            slideShowButton.setTitle("停止", for: .normal)
        }
    }
    
    // Timerによって一定の間隔で呼び出される関数
    func updateTimer(timer: Timer) {
        
        //表示している画像の番号を1増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func zoomImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "zoom", sender: nil)
        
        if timer != nil {
            //タイマーを破棄する
            timer.invalidate()
            timer = nil
            prevButton.isEnabled = true
            nextButton.isEnabled = true
            slideShowButton.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        // 遷移先のResultViewControllerで宣言しているxに値を代入して渡す
        resultViewController.x = dispImageNo

    }
    

}

