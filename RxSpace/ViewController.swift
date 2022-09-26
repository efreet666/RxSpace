//
//  ViewController.swift
//  RxSpace
//
//  Created by Влад Бокин on 23.09.2022.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    public func example(_ rxOperator: String, action: () -> () ) {
        print(rxOperator)
        action()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        example("test") {
            let stringObservable = Observable.just("Hello")
            let intObservable = Observable.just(22)
            print(stringObservable, intObservable)
        }
        
        example("RxTest2") {
            let observable = Observable.just("Hello, RxSwift")
            observable.subscribe( { event in
                print(event)
            })
        }
        
        example("RxTest3") {
            let observable = Observable.of(1, 2, 3, 4, 5)
            observable.subscribe {
                print( $0 )
            }
        }
        
        example("RxTest4") {
            let items = [1,2,3,4,5]
            Observable.from(items).subscribe { event in
                print(event)
            } onError: { err in
                print(err)
            } onCompleted: {
                print("Ok!")
            } onDisposed: {
                print("Disposed")
            }

        }
        
        example("DisposeTest") {
            let disposeBug = DisposeBag()
            let seq = [1,2,3,4,5]
            let subscription = Observable.from(seq)
            subscription.subscribe( { event in
                print(event)
            }).disposed(by: disposeBug)
        }
        
        example("takeUntil") {
            let stopSeq = Observable.just(1).delaySubscription(.seconds(2), scheduler: MainScheduler.instance)
            let seq = Observable.from([1,2,3,4,5]).take(until: stopSeq)
            seq.subscribe( { event in
                print(event)
            })
        }
         
        //publishSubject - уведомлять подписчиков только с того момента как они подписались
        example("PublishSubject") {
            let disposeBag = DisposeBag()
            
            let subject = PublishSubject<String>()
            
            subject.subscribe( { event in
                print("Subscriber 1", event)
                
            }).disposed(by: disposeBag)
            subject.onNext("Hello")
            
            subject.subscribe(onNext: { event in
                print("subscriber 2", event)
                
            })
            subject.on(.next("RxSwift"))
            
        }
        

        // behaviorSubject - создается с начальным значение, которое получает, а последующие подписчики получают предыдущее значение и все новые значения
        
        example("BehaviorSubject") {
            let disposeBag = DisposeBag()
            
            let behaviourSubject = BehaviorSubject(value: "Hello")
            
            behaviourSubject.subscribe({ event in
                print("first", event)
            }).disposed(by: disposeBag)
            
            behaviourSubject.on(.next("RxSwift"))
            
            behaviourSubject.subscribe( { event in
                print("second", event)
                
            }).disposed(by: disposeBag)
            
            behaviourSubject.onNext("World")
        }
         
        example("map") {
            let bag = DisposeBag()

            var array = [1, 2, 3]

            let observable = Observable<Int>.from(array).map { $0 * 2 }

            _ = observable.subscribe { (e) in
                print(e)
            }.disposed(by: bag)
            
        }
         */
        
        //ReplaySubject — а вот это самый ответственный, при создании мы указываем ему размер буфера (сколько значений будет запоминать), в результате он хранит в памяти последние n значений и посылает их сразу новому подписчику.
        
        example("ReplaySubject") {
            let disposeBag = DisposeBag()
            
            let ReplaySubject = ReplaySubject<String>.create(bufferSize: 1)
            
            ReplaySubject.subscribe({ event in
                print("first", event)
            }).disposed(by: disposeBag)
            
            ReplaySubject.on(.next("RxSwift"))
            ReplaySubject.onNext("World")
            ReplaySubject.onNext("Vlad")
            
            ReplaySubject.subscribe( { event in
                print("second", event)
                
            }).disposed(by: disposeBag)
            
            
            ReplaySubject.onNext("Rx")
        }
    }
}

