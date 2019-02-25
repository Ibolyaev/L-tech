//
//  DetailDetailViewController.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, DetailViewInput {
    
    // MARK: - IBOutlet
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var elementImageView: UIImageView!
    @IBOutlet var titlelabel: UILabel!
    
    // MARK: - Public properties
    var output: DetailViewOutput!
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: - Public methods
    func setDetailLabelText(with text: String) {
        DispatchQueue.main.async {
            self.detailLabel.text = text
        }
    }
    func setTitlelabel(with text: String) {
        DispatchQueue.main.async {
            self.titlelabel.text = text
        }
    }
    func setElementImageView(with imageUrl: URL?) {
        elementImageView.kf.setImage(with: imageUrl)
    }
    func setTitle(with text: String) {
        DispatchQueue.main.async {
            self.navigationItem.title = text
        }
    }
    
    // MARK: DetailViewInput
    func setupInitialState() {
    }
}
