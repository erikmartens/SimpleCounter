//
//  CounterListObjectsListTableDelegateDataSource.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxSwift
import RxCocoa

class CounterCollectionsListTableDelegateDataSource: TableDelegateDataSource {
  
  private static let cellIdentifier = Constants.Identifier.TableCell.counterListObjectsListCellIdentifier
  
  // MARK: - Properties
  
  weak var cellSelectedSubject: PublishSubject<String>?
  
  // MARK: - Initialization
  
  init() {
    super.init(cellIdentifier: CounterCollectionsListTableDelegateDataSource.cellIdentifier)
  }
  
  // MARK: - TableView Delegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if let cellViewModel = sectionsSource[indexPath] as? CounterCollectionsListTableCellViewModel {
      cellSelectedSubject?.on(.next(cellViewModel.counterCollectionModel.identifier))
    }
    
    return indexPath
  }
}

extension CounterCollectionsListTableDelegateDataSource {
  
  func observeData(
    dependencies: CounterCollectionsListViewModel.Dependencies,
    cellSelectedSubject: PublishSubject<String>
  ) {
    self.cellSelectedSubject = cellSelectedSubject
    
    // TODO
  }
}
