//
//  VerticalPaginationManager.swift
//  Images App
//
//  Created by Fray Pineda on 11/28/20.
//

import Foundation
import UIKit

protocol VerticalPaginationManagerDelegate: class {
    func refreshAll(completion: @escaping (Bool) -> Void)
    func loadMore(completion: @escaping (Bool) -> Void)
}

class VerticalPaginationManager: NSObject {
    private var isLoading = false
       private var isObservingKeyPath: Bool = false
       private var scrollView: UIScrollView!
       private var bottomMostLoader: UIView?
       private var topMostLoader: UIView?
    var refreshViewColor: UIColor = .gray
    var loaderColor: UIColor = .blue
    
    weak var delegate: VerticalPaginationManagerDelegate?
    
        init(scrollView: UIScrollView) {
           super.init()
           self.scrollView = scrollView
           self.addScrollViewOffsetObserver()
       }
       
       deinit {
           self.removeScrollViewOffsetObserver()
       }
       
       func initialLoad() {
           self.delegate?.refreshAll(completion: { _ in })
       }
}

//MARK: Down loader

extension VerticalPaginationManager {
    
    private func addBottomMostControl() {
        let view = UIView()
        view.backgroundColor = self.refreshViewColor
        view.frame.origin = CGPoint(x: 0, y: self.scrollView.contentSize.height)
        view.frame.size = CGSize(width: self.scrollView.bounds.width,
                                 height: 60.0)
        let activity = UIActivityIndicatorView(style: .gray)
        activity.color = self.loaderColor
        activity.frame = view.frame
        activity.startAnimating()
        view.addSubview(activity)
        self.scrollView.contentInset.bottom = view.frame.height
        self.bottomMostLoader = view
//        self.scrollView.addSubview(view)
    }
    
    func removeBottomLoader() {
        self.bottomMostLoader?.removeFromSuperview()
        self.bottomMostLoader = nil
        print("content inset before: \(self.scrollView.contentInset)")
        self.scrollView.contentInset.bottom = .zero
        print("content inset after: \(self.scrollView.contentInset)")
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
}

extension VerticalPaginationManager {
    private func addTopMostControl() {
          let view = UIView()
          view.backgroundColor = self.refreshViewColor
        view.frame.origin = CGPoint(x: 0.0,
                                    y: 0.0)
        view.frame.size = CGSize(width: self.scrollView.bounds.width,
                                 height: 60.0)
          let activity = UIActivityIndicatorView(style: .gray)
          activity.color = self.loaderColor
          activity.frame = view.bounds
          activity.startAnimating()
          view.addSubview(activity)
        self.scrollView.contentInset.top = view.frame.height
          self.topMostLoader = view
          self.scrollView.addSubview(view)
      }
    
    func removeTopLoader() {
           self.topMostLoader?.removeFromSuperview()
           self.topMostLoader = nil
       }
}

extension VerticalPaginationManager {
    
    private func addScrollViewOffsetObserver() {
        if self.isObservingKeyPath { return }
        self.scrollView.addObserver(
            self,
            forKeyPath: "contentOffset",
            options: [.new],
            context: nil
        )
        self.isObservingKeyPath = true
    }
    
    private func removeScrollViewOffsetObserver() {
        if self.isObservingKeyPath {
            self.scrollView.removeObserver(self,
                                           forKeyPath: "contentOffset")
        }
        self.isObservingKeyPath = false
    }
    
    override public func observeValue(forKeyPath keyPath: String?,
                                        of object: Any?,
                                        change: [NSKeyValueChangeKey : Any]?,
                                        context: UnsafeMutableRawPointer?) {
          guard let object = object as? UIScrollView,
              let keyPath = keyPath,
              let newValue = change?[.newKey] as? CGPoint,
              object == self.scrollView, keyPath == "contentOffset" else { return }
          self.setContentOffSet(newValue)
      }
    
    private func setContentOffSet(_ offset: CGPoint) {
            let offsetY = offset.y
           if offsetY < -100 && !self.isLoading {
            self.scrollView.isScrollEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.scrollView.isScrollEnabled = true
            }
               self.isLoading = true
               self.delegate?.refreshAll { success in
                   self.isLoading = false
               }
               return
           }
           
           let contentHeight = self.scrollView.contentSize.height
           let frameHeight = self.scrollView.bounds.size.height
           let diffY = contentHeight - frameHeight
           if contentHeight > frameHeight,
           offsetY > (diffY + 130) && !self.isLoading {
            self.scrollView.isScrollEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.scrollView.isScrollEnabled = true
                   self.isLoading = true
                   self.delegate?.loadMore { success in
                       self.isLoading = false
                   }
               }
            }

       }
    
}
