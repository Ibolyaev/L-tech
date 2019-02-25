//
//  ListListInitializer.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit

class ListModuleInitializer: NSObject {
    
    //Connect with object on storyboard
    @IBOutlet weak var listViewController: ListViewController!

    override func awakeFromNib() {

        let configurator = ListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listViewController)
    }

}
