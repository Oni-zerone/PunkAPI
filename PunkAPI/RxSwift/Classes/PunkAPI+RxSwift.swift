//
//  PunkAPI+RxSwift.swift
//  Pods
//
//  Created by Andrea Altea on 05/10/2019.
//

import Foundation
import RxSwift

extension PunkApi {
    
    var rx: Reactive<PunkApi> {
        return Reactive(self)
    }
}

extension Reactive where Base: PunkApi {
    
    func get(_ request: PunkAPI.Request) -> Observable<[PunkAPI.Beer]> {
        return Observable<[PunkAPI.Beer]>.create { observer in
            let task = self.base.get(request) { result in
                do {
                    observer.onNext(try result.get())
                } catch let error {
                    observer.onError(error)
                }
            }
            return Disposables.create(with: task?.cancel ?? {})
        }
    }
}
