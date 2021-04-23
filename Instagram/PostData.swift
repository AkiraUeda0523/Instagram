//
//  PostData.swift
//  Instagram
//
//  Created by 上田晃 on 2021/04/08.
//

import UIKit
import Firebase
import SVProgressHUD

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    //コメント
    var comment: String?
    //コメント時刻
    //var commentDate: Date?
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        dump(document)
        let postDic = document.data()
        
        self.name = postDic["name"] as? String
        
        self.caption = postDic["caption"] as? String
        
        self.comment = postDic["comment"] as? String
        
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }
}
