//
//  ItemSelectedProtocol.swift
//  LeeYunhak-practice-3
//
//  Created by 이윤학 on 10/28/23.
//

import UIKit

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}
