//
//  CounterListObjectsListViewModel.swift
//  SimpleCounter
//
//  Created by Erik Maximilian Martens on 26.03.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import RxSwift
import RxCocoa
import RxFlow

extension CounterCollectionsListViewModel {
  struct Dependencies {
    weak var stepper: CounterCollectionsListStepper?
    let dataSource: CounterCollectionsListTableDelegateDataSource
  }
}

class CounterCollectionsListViewModel {
  
  // MARK: - Subject
  
  let onViewDidAppearSubject = PublishSubject<Void>()
  let onSortButtonPressedSubject = PublishSubject<Void>()
  let onAddButtonPressedSubject = PublishSubject<Void>()
  let onCellSelectedSubject = PublishSubject<String>()
  
  // MARK: - Assets
  
  private let disposeBag = DisposeBag()
  
  var stepper: CounterCollectionsListStepper? {
    dependencies.stepper
  }
  
  var dataSource: CounterCollectionsListTableDelegateDataSource {
    dependencies.dataSource
  }
  
  // MARK: - Properties
  
  let dependencies: Dependencies
  
  // MARK: - Initialization
  
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  // MARK: - Functions
  
  func observeEvents() {
    observeUserInputEvents()
    observeUserSearchEvents()
    
    dependencies.dataSource.observeData(
      dependencies: dependencies,
      cellSelectedSubject: onCellSelectedSubject
    )
  }
}

private extension CounterCollectionsListViewModel {
  
  func observeUserInputEvents() {
    
    // TODO configure sorting
    
    guard let stepper = stepper else {
      return
    }
    
    onCellSelectedSubject
      .map { ListStep.counterCollectionDetails(identifier: $0) }
      .bind(to: stepper.steps)
      .disposed(by: disposeBag)
    
    onAddButtonPressedSubject
      .map { ListStep.addCounterCollection }
      .bind(to: stepper.steps)
      .disposed(by: disposeBag)
  }
  
  func observeUserSearchEvents() {
    // TODO
  }
}
