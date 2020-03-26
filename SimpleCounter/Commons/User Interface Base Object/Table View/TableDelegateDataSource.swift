//
//  TableDataSourceDelegate.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 25.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableDelegateDataSource: NSObject {
  var sectionsSource: BehaviorRelay<[TableSection]?> = BehaviorRelay(value: nil)
  private let cellIdentifier: String
  
  let disposeBag = DisposeBag()
  
  init(cellIdentifier: String) {
    self.cellIdentifier = cellIdentifier
  }
}

extension TableDelegateDataSource: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    sectionsSource.value?[safe: section]?.sectionTitleHeight ?? 0
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? TableCell else {
      fatalError("This cell type is unsupported. Please use `TableCell` instead.")
    }
    switch cell.style {
    case .none:
      break
    case .alwaysRounded:
      cell.configureCellStyle(with: .middle, cornerRadius: Constants.Theme.Weight.medium.cornerRadiusValue)
    case .cellPositonBased:
      let cellPosition = indexPath.cellState(for: tableView.numberOfRows(inSection: indexPath.section))
      cell.configureCellStyle(with: cellPosition, cornerRadius: Constants.Theme.Weight.medium.cornerRadiusValue)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
}

extension TableDelegateDataSource: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    sectionsSource.value?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    sectionsSource.value?[safe: section]?.rowsCount ?? 0
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    sectionsSource.value?[safe: section]?.sectionTitle
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableCell else {
      fatalError("This cell type is unsupported. Please use `TableCell` instead.")
    }
    cell.configure(withViewModel: sectionsSource[indexPath])
    return cell
  }
}

private extension BehaviorRelay where Element == [TableSection]? {
  subscript (indexPath: IndexPath) -> TableCellViewModel? {
    value?[safe: indexPath.section]?.sectionItems[safe: indexPath.row]
  }
}

private extension IndexPath {
  func cellState(for totalCellCount: Int) -> TableCellPosition {
    var position: TableCellPosition = .middle
    
    if totalCellCount < 2 {
      position = .single
    } else if self.row == 0 {
      position = .top
    } else if self.row == totalCellCount - 1 {
      position = .bottom
    }
    
    return position
  }
}
