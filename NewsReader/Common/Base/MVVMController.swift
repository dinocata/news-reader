//
//  MVVMController.swift
//  NewsReader
//
//  Created by Dino Catalinac on 16/01/2020.
//  Copyright © 2020 Dino Catalinac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MVVMController<T: ViewModelType>: UIViewController {
    
    var viewModel: T
    var coordinator: SceneCoordinatorType
    var disposeBag = DisposeBag()
    
    required init(viewModel: T, coordinator: SceneCoordinatorType) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindOutput(output: viewModel.transform(input: bindInput()))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let actualController = actualViewController()
        if actualController !== coordinator.currentViewController {
            coordinator.currentViewController = actualController
        }
    }
    
    func bindInput() -> T.Input {
        fatalError("createInput() has not been implemented")
    }
    
    func bindOutput(output: T.Output) {
        fatalError("onCreateOutput(output: ViewModelType.Output) has not been implemented")
    }
    
    /// Binder that performs transition to the emmitted scene.
    var transition: Binder<Scene> {
        return Binder(self) { controller, scene in
            controller.coordinator.transition(to: scene, type: scene.defaultTransitionType, completion: nil)
        }
    }
}
