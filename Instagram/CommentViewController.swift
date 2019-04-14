//
//  CommentViewController.swift
//  Instagram
//
//  Created by KUNI K on 2019/04/08.
//  Copyright © 2019 QQ201901. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    


    @IBOutlet weak var commentTableView: UITableView!
    
    
    var postArray: [PostData] = []
    
//    var commentTableView:  UITableView!
    // DatabaseのobserveEventの登録状態を表す
    var observing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        
        // テーブルセルのタップを無効にする
        commentTableView.allowsSelection = false
        
        let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        commentTableView.register(nib, forCellReuseIdentifier: "CCell")
        
        // テーブル行の高さをAutoLayoutで自動調整する
        commentTableView.rowHeight = UITableView.automaticDimension
        // テーブル行の高さの概算値を設定しておく
        // 高さ概算値 = 「縦横比1:1のUIImageViewの高さ(=画面幅)」+「いいねボタン、キャプションラベル、その他余白の高さの合計概算(=100pt)」
        commentTableView.estimatedRowHeight = UIScreen.main.bounds.width + 100
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG_PRINT: viewWillAppear")
    
    }
    
 
    
    
    override func loadView() {
        if let view = UINib(nibName: "CommentTableViewCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "CCell", for: indexPath) as! PostTableViewCell
        cell.setPostData(postArray[indexPath.row])
        
        // セル内のキャンセルボタンのアクションをソースコードで設定する
        cell.likeButton.addTarget(self, action:#selector(handleButton3(_:forEvent:)), for: .touchUpInside)

        
        return cell
    }
    

    @objc func handleButton3(_ sender: UIButton, forEvent event: UIEvent) {
        print("DEBUG_PRINT: commentボタンがタップされました。")
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
}


