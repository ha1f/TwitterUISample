//
//  PostTweetViewController.swift
//  TwitterUISample
//

import UIKit

final class PostTweetViewController: UIViewController {
    lazy var cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTapped(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        navigationItem.leftBarButtonItem = cancelItem
    }
    
    @objc
    func cancelButtonDidTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
