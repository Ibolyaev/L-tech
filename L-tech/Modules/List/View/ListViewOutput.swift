//
//  ListListViewOutput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import UIKit
protocol ListViewOutput {
    var list: [ElementViewModel] {
        get
    }
    func selectElement(index: Int)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func viewIsReady()
    func listUpdateButtonTapped()
    func setListSort(_ sort: Int)
}
