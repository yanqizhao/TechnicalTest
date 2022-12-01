//
//  ItemListViewController.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import UIKit

class ItemListViewController: UITableViewController, ActivityIndicatorLodable, ErrorViewPresentable {

    override var tableView: UITableView! {
        didSet {
            tableView.register(ItemListCell.self)
            tableView.alpha = 0
        }
    }
    
    lazy var presenter: ItemListPresenter = ItemListPresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }

}

extension ItemListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowsCount
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.getItem(at: indexPath)
        let cell = tableView.dequeueCell(for: ItemListCell.self)
        cell.update(item: item)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.onSelectItem(at: indexPath)
    }

}

extension ItemListViewController: ItemListPresenterDelegate {
    
    func didChange(title: String) {
        self.title = title
    }
    
    func didStartBackgroundActivity() {
        showActivityIndicator()
    }
    
    func didFinishBackgroundActivity() {
        hideActivityIndicator()
    }
    
    func onUpdateItemData(with items: [DTOListItem]) {
        removeFullScreenErrorView()
        tableView.alpha = 1
        tableView.reloadData()
    }
    
    func onUpdateItemDataFailure(error: Error) {
        let errorInfo = UIOErrorInfo.init(error: error) { [weak self] errorView in
            errorView.showActivityIndicator()
            self?.presenter.update {
                errorView.hideActivityIndicator()
            }
        }
        showFullScreen(errorInfo: errorInfo)
    }
    
    func onNavigateDetailPage(with id: String) {
        let alert = UIAlertController(title: "Coming soon", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        navigationController?.present(alert, animated: true)
    }
    
}

