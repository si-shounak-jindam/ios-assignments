//
//  RecentChat.swift
//  Messenger
//
//  Created by Shounak Jindam on 16/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct RecentChat: Codable {
    
    var id = ""
    var chatRoomId = ""
    var senderId = ""
    var senderName = ""
    var receiverId = ""
    var receiverName = ""
    @ServerTimestamp var date = Date()
    var memberIds =  [""]
    var lastMessage = ""
    var unreadCounter = 0
    var avatarLink = ""
    
    
}
