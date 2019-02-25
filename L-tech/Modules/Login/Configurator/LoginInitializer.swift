//
//  LoginLoginInitializer.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var loginViewController: LoginViewController!

    override func awakeFromNib() {

        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}
