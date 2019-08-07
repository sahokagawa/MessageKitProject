//
//  ChatUser.swift
//  MessageKitProject
//
//  Created by 香川紗穂 on 2019/08/05.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

//import Foundation
import  MessageKit

//ユーザーの情報を持っておくクラス
// MessageKit の中にある　SenderType を継承　
class ChatUser: SenderType {
//    プロパティ　ユーザーID
    var senderId: String
//    プロパティ　　表示名
    var displayName: String
//コンストラクタ（クラスをインスタンス化するときに一番最初に呼ばれるもの）
//ChatUseを作るときは必ずユーザーIDと表示名を設定するようにする
    init(senderId: String, displayName: String) {
        self.senderId = senderId
        self.displayName = displayName
    }
    
//    let senderId = ""
//    let displayName =  "” がなかった時もエラーで教えてくれる
//    プロパティの設定し忘れを防止できる
    
}
