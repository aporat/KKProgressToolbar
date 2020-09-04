//
//  ViewController.swift
//  ProgressToolbar
//
//  Created by Adar Porat on 8/24/20.
//  Copyright © 2020 Adar Porat. All rights reserved.
//

import KKProgressToolbar
import UIKit

class ViewController: UIViewController {
    fileprivate lazy var loadingToolbar: KKProgressToolbar = {
        let view = KKProgressToolbar()
        view.progressBar.barBorderColor = .black
        view.progressBar.barBackgroundColor = .black
        view.progressBar.barBorderWidth = 1
        view.progressBar.barFillColor = .white
        view.isHidden = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadingToolbar.actionDelegate = self
        loadingToolbar.frame = CGRect(x: 0, y: view.bounds.size.height, width: view.bounds.size.width, height: 55)
        view.addSubview(loadingToolbar)
    }

    @IBAction func showToolbar(_: Any) {
        loadingToolbar.show(true, completion: nil)
        loadingToolbar.text = NSLocalizedString("Loading...", comment: "")
        loadingToolbar.progressBar.progress = 0.5
    }

    @IBAction func hideToolbar(_: Any) {
        loadingToolbar.hide(true, completion: nil)
    }
}

// MARK: - KKProgressToolbarDelegate

extension ViewController: KKProgressToolbarDelegate {
    func didCancelButtonPressed(_: KKProgressToolbar) {}
}
