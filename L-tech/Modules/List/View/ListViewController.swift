//
//  ListListViewController.swift
//  L-tech
//
//  Created by Ibolyaev on 21/02/2019.
//  Copyright © 2019 Igor Bolyaev. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewController: UIViewController, ListViewInput {
    
    // MARK: - Identifiers
    let identifier = "ElementViewCell"
    let selfToDetailSegue = "selfToDetailSegue"

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public properties
    var output: ListViewOutput!
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        output.viewIsReady()
    }
    
    // MARK: - IBAction
    @IBAction func updateListButtonItem(_ sender: UIBarButtonItem) {
        output.listUpdateButtonTapped()
    }
    @IBAction func sortSegmentedControlChanged(_ sender: UISegmentedControl) {
        output.setListSort(sender.selectedSegmentIndex)
    }
    
    // MARK: - Public methods
    func updateList() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        tableView.register(UINib(nibName: "ElementViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        output.prepare(for: segue, sender: sender)
    }
    
    // MARK: ListViewInput
    func setupInitialState() {
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.list.count
    }    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elementViewModel = output.list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ElementViewCell else {
            assertionFailure("Failed to get cell ElementViewCell")
            return UITableViewCell()
        }
        cell.titleLabel.text = elementViewModel.title
        cell.detailLabel.text = elementViewModel.text
        cell.dateLabel.text = elementViewModel.date
        cell.elementImageVIew.kf.setImage(with: elementViewModel.image)
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.selectElement(index: indexPath.row)
    }
}
