//
//  ViewController.swift
//  MessageKitProject
//
//  Created by 香川紗穂 on 2019/08/05.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

import UIKit
//追加
import MessageKit
import InputBarAccessoryView

//ViewControllerはUIViewControllerを継承している
//class ViewController: UIViewController {

class ViewController: MessagesViewController {
// MessagesViewControllerはMessageKitに入っているコントローラ　　　継承変更
    
    
//    全メッセージを保持する配列
    var messageList: [Message] = [ ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate  = self
        messageInputBar.delegate = self
        
    }

}




extension ViewController: MessagesDataSource{
//    自分の情報
    func currentSender() -> SenderType {
        let id = "1234"
        let name = "SeedKun"
        return ChatUser(senderId: id, displayName: name)
    }
    
//    表示するメッセージの情報
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageList[indexPath.section]
    }
//    メッセージの件数
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
       return messageList.count
    }
    
    
}




//送信ボタンの処理　　　　　これもMessageKitに含まれてる機能
extension ViewController: InputBarAccessoryViewDelegate{
    
//    送信ボタンがクリックされた時の処理
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
//        送信者の作成(自分の情報を取得）
        let me = self.currentSender() as! ChatUser
        
//        メッセージ作成
        let message = Message(user: me, text: text, messageId: UUID().uuidString, sentDate: Date())
        messageList.append(message)
        
        
//        作成したメッセージを画面に追加
        messagesCollectionView.insertSections([messageList.count - 1])
        
//    入力バーのリセット
        inputBar.inputTextView.text = ""
        
//        スラックボットみたいなやつ！　　　返信を作成
        let other = ChatUser(senderId: "9999", displayName: "UserName")
//        let replyMessage = Message(user: other, text: "なんですか", messageId: UUID().uuidString, sentDate: Date())
//         messageList.append(replyMessage)
//        messagesCollectionView.insertSections([messageList.count - 1])
        
        
//  ①
//        if text == "おなか" {
//            let replyMessage = Message(user: other, text: "すいた", messageId: UUID().uuidString, sentDate: Date())
//            messageList.append(replyMessage)
//            messagesCollectionView.insertSections([messageList.count - 1])
//        }else{
//            let replyMessage2 = Message(user: other, text: "なんですか", messageId: UUID().uuidString, sentDate: Date())
//            messageList.append(replyMessage2)
//            messagesCollectionView.insertSections([messageList.count - 1])
//        }
        
//  ②
        var replyMessage: Message
        if text == "おなか" {
            replyMessage = Message(user: other, text: "すいた", messageId: UUID().uuidString, sentDate: Date())
        }else{
            replyMessage = Message(user: other, text: "なんですか", messageId: UUID().uuidString, sentDate: Date())
        }
        messageList.append(replyMessage)
        messagesCollectionView.insertSections([messageList.count - 1])
        
    }
}






extension ViewController: MessagesDisplayDelegate{
    
}

extension ViewController: MessagesLayoutDelegate{
    
}
