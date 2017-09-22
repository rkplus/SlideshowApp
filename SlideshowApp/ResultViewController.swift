//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Ratnesh Kumar on 2017/09/22.
//  Copyright © 2017年 ratonesshu_kuma_ru. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!

    let imageNameArray2 = [
        "dog1.jpeg",
        "dog2.jpg",
        "dog3.jpg",
        ]
    
    var x:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //表示している画像の番号を元に画像を表示する
//不要        func displayImage(){
            
            // 表示している画像の番号から名前を取り出し
            let name = imageNameArray2[x]
            
            //画像を読み込み
            let image = UIImage(named:name)
            
            //Image Viewに読み込んだ画像をセット
            imageView2.image = image
            
  //不要      }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
