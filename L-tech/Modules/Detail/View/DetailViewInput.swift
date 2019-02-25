//
//  DetailDetailViewInput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import Foundation

protocol DetailViewInput: class {
    func setTitle(with text: String)
    func setDetailLabelText(with text: String)
    func setTitlelabel(with text: String)
    func setElementImageView(with imageUrl: URL?)
    func setupInitialState()
}
