//
//  DetailDetailInitializer.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit

class DetailModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailViewController: DetailViewController!

    override func awakeFromNib() {

        let configurator = DetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailViewController)
    }

}
