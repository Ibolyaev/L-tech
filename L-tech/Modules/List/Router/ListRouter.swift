//
//  ListListRouter.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//
import UIKit
class ListRouter: ListRouterInput {
    weak var viewController: ListViewController!
    
    init(viewController: ListViewController) {
        self.viewController = viewController
    }
    
    func showDetail(selectedElement: ElementViewModel) {
        viewController.performSegue(withIdentifier: viewController.selfToDetailSegue, sender: selectedElement)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController,
            let selectedElement = sender as? ElementViewModel {
            detailVC.output.selectedElement = selectedElement
        }
    }

}
