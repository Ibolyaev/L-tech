//
//  DetailDetailViewOutput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

protocol DetailViewOutput {
    func viewIsReady()
    var selectedElement: ElementViewModel! {
        get set
    }
}
