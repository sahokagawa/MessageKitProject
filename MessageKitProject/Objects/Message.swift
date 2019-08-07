//
//  Message.swift
//  MessageKitProject
//
//  Created by 香川紗穂 on 2019/08/05.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

//import Foundation
import MessageKit

//一件のメッセージのデータを持つクラス
class Message: MessageType {
//    送信者
    let user: ChatUser
    
//    メッセージの本文
    let text: String
    
//    メッセージID(一件のメッセージを特定するため）
    let messageId: String
    
//    送信日時
    let sentDate : Date
    
//    コンストラクタ
    init(user: ChatUser, text: String, messageId:String, sentDate: Date ) {
        self.user = user
        self.text = text
        self.messageId = messageId
        self.sentDate = sentDate
        
    }
    
//    メッセージの送信者を返す
    var sender: SenderType{
        return Sender(id: user.senderId, displayName: user.displayName)
    }
    
//    メッセージのタイプを返す
    var kind: MessageKind {
        return .text(text)
    }
    
    
}
