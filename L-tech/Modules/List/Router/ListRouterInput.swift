//
//  ListListRouterInput.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import Foundation
import UIKit

protocol ListRouterInput {
    func showDetail(selectedElement: ElementViewModel)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
