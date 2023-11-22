//
//  Status.swift
//  Messenger
//
//  Created by Shounak Jindam on 13/10/23.
//

import Foundation

enum Status: String {
    
    case Available = "Available"
    case Busy = "Busy"
    case AtSchool = "At the School"
    case AtTheMovies = "At the Movies"
    case AtWork = "At Work"
    case BatteryAboutToDie = "Battery About to die"
    case CantTalk = "Can't Talk"
    case InAMeeting = "In a meetin"
    case AtTheGym = "At gym"
    case Sleeping = "Sleepin"
    case UrgentCallsOnly = "Urgent calls only"
    
    static var array: [Status] {
        var a: [Status] = []
        
        switch Status.Available {
        case .Available:
            a.append(.Available); fallthrough
        case .Busy:
            a.append(.Busy); fallthrough
        case .AtSchool:
            a.append(.AtSchool); fallthrough
        case .AtTheMovies:
            a.append(.AtTheMovies); fallthrough
        case .BatteryAboutToDie:
            a.append(.BatteryAboutToDie); fallthrough
        case .CantTalk:
            a.append(.CantTalk); fallthrough
        case .InAMeeting:
            a.append(.InAMeeting); fallthrough
        case .AtTheGym:
            a.append(.AtTheGym); fallthrough
        case .Sleeping:
            a.append(.Sleeping); fallthrough
        case .UrgentCallsOnly:
            a.append(.UrgentCallsOnly); fallthrough
        case .AtWork:
            a.append(.AtWork)
        return a
        }
    }
}
