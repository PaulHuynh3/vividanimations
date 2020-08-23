//
//  FeedbackViewController.swift
//  VividAnimations
//
//  Created by Paul Huynh on 2020-08-23.
//  Copyright © 2020 PXSDevelopment. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!


    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor = .blue
    }

    @IBAction func viewDidTapped(_ sender: Any) {

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {

            self.titleLabel.transform = CGAffineTransform(translationX: -50, y: 0)


        }) { (_) in

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {

                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)

            })
        }

        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {

            self.descriptionLabel.transform = CGAffineTransform(translationX: -50, y: 0)


        }) { (_) in

            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {

                self.descriptionLabel.alpha = 0
                self.descriptionLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)

            }) { (_) in
                self.reset()
            }
        }

    }

    func reset() {
        self.titleLabel.transform = CGAffineTransform.identity
        self.descriptionLabel.transform = CGAffineTransform.identity
        self.titleLabel.alpha = 1
        self.descriptionLabel.alpha = 1
    }
}
