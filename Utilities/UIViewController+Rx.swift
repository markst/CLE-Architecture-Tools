//
//  UIViewController+Rx.swift
//
//  Created by Daniel Tartaglia on 4/13/20.
//  Copyright © 2020 Daniel Tartaglia. MIT License.
//

import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UIViewController {

	var viewWillAppear: Observable<Bool> {
		return base.rx.methodInvoked(#selector(UIViewController.viewWillAppear(_:)))
			.map { $0[0] as! Bool }
	}

	var viewDidDisappear: Observable<Bool> {
		return base.rx.methodInvoked(#selector(UIViewController.viewDidDisappear(_:)))
			.map { $0[0] as! Bool }
	}

	func dismissSelf(animated: Bool) -> Observable<Void> {
		Observable.deferred { [base] in
			remove(child: base, animated: animated)
			return Observable.just(())
		}
	}
}
