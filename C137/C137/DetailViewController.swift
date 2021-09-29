//
//  DetailViewController.swift
//  C137
//
//  Created by kayesh Abhisheka on 2021-08-13.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        navigationItem.largeTitleDisplayMode = .never

        if let imageTOLoad = selectedImage {
            imageView.image = UIImage(named: imageTOLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))     //display share button
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareTapped() {
       let image = imageView.image?.jpegData(compressionQuality: 0.8)
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    

}
