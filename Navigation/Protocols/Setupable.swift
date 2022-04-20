//
//  Setupable.swift
//  Navigation
//
//  Created by alisa on 05.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
