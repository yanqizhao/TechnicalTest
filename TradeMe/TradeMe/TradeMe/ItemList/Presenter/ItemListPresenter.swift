//
//  ItemListPresenter.swift
//  TradeMe
//
//  Created by Yanqi Zhao on 1/12/22.
//

import Foundation

protocol ItemListPresenterDelegate: AnyObject {
    
    func didChange(title: String)
    func didStartBackgroundActivity()
    func didFinishBackgroundActivity()
    func onUpdateItemData(with items: [DTOListItem])
    func onUpdateItemDataFailure(error: Error)
    func onNavigateDetailPage(with id: String)
    
}

final class ItemListPresenter {
    
    private weak var delegate: ItemListPresenterDelegate?
    private let interactor: ItemListProtocol
    private(set) var items: [DTOListItem] = []
    
    init(delegate: ItemListPresenterDelegate, interactor: ItemListProtocol = ItemFacade()) {
        self.delegate = delegate
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
        delegate?.didChange(title: "Browse")
        delegate?.didStartBackgroundActivity()
        update { [weak self] in
            self?.delegate?.didFinishBackgroundActivity()
        }
    }
    
    func update(onCompletion: (() -> Void)?) {
        interactor.getItemList { [weak self] result in
            switch result {
            case .success(let items):
                self?.items = items
                self?.delegate?.onUpdateItemData(with: items)
            case .failure(let error):
                self?.delegate?.onUpdateItemDataFailure(error: error)
            }
            onCompletion?()
        }
    }
    
    func onSelectItem(at indexPath: IndexPath) {
        let item = getItem(at: indexPath)
//        delegate?.onNavigateDetailPage(with: item.id)
    }
    
    var rowsCount: Int {
        return items.count
    }
    
    func getItem(at indexPath: IndexPath) -> DTOListItem {
        return items[indexPath.row]
    }
    
}
