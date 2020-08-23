//
//  FeedbackViewController.swift
//  VividAnimations
//
//  Created by Paul Huynh on 2020-08-23.
//  Copyright © 2020 PXSDevelopment. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet var umbrellaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var animator: UIViewPropertyAnimator?
    let sliderAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUmbrellaSetup()
        configureUmbrellaEnlargementAnimation()
    }

    func reset() {
        self.titleLabel.transform = CGAffineTransform.identity
        self.descriptionLabel.transform = CGAffineTransform.identity
        self.titleLabel.alpha = 1
        self.descriptionLabel.alpha = 1
    }
    // MARK: - Chain Animation
    @IBAction func firstButtonTapped(_ sender: Any) {
        chainAnimation()
    }

    // MARK: - Bounce Animation
    @IBAction func secondButtonTapped(_ sender: Any) {

        let titleLabelBounds = titleLabel.bounds
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.titleLabel.bounds = CGRect(x: self.titleLabel.bounds.origin.x - 20, y: self.titleLabel.bounds.origin.y, width: self.titleLabel.bounds.size.width + 60, height: self.titleLabel.bounds.size.height)
        }) { (_) in

            UIView.animate(withDuration: 0.5) {
                self.titleLabel.bounds = titleLabelBounds
            }
        }
    }

    @IBAction func thirdButtonTapped(_ sender: Any) {
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
            self.titleLabel.transform = CGAffineTransform(translationX: -50, y: 0)
        }

        animator?.startAnimation()

        animator?.addCompletion { (_) in
            self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
        }

    }

    @IBAction func fourthButtonTapped(_ sender: Any) { }

     @IBAction func fifthButtonTapped(_ sender: Any) { }


    @IBAction func navigateTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let feedBackViewController2 = storyboard.instantiateViewController(withIdentifier: String(describing: FeedBackViewController2.self)) as? FeedBackViewController2 else { return }

        navigationController?.pushViewController(feedBackViewController2, animated: true)
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        reset()
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        sliderAnimator.fractionComplete = CGFloat(sender.value)
    }

    func configureInitialUmbrellaSetup() {
        umbrellaImageView.alpha = 0
        umbrellaImageView.transform = CGAffineTransform(translationX: 0, y: 0)
    }

    func configureUmbrellaEnlargementAnimation() {
        sliderAnimator.addAnimations {
            self.umbrellaImageView.alpha = 1
            self.umbrellaImageView.transform = CGAffineTransform(translationX: 3, y: 3) //bug - its not expanding
        }

        sliderAnimator.addAnimations ({
            self.umbrellaImageView.frame.origin.y += 400
        }, delayFactor: 0.5) //50% looks at the slider value
    }


    func chainAnimation() {
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

}
