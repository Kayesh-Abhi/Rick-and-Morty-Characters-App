//
//  ViewController.swift
//  C137
//
//  Created by kayesh Abhisheka on 2021-08-13.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "C-137"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.contains("R&M") {
                pictures.append(item)
            }
        }
        
        pictures = pictures.sorted(by: {
           return ($0 as NSString).deletingPathExtension.compare(($1 as NSString).deletingPathExtension, options: .numeric) == .orderedAscending
        })
        print(pictures)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
//        cell.textLabel?.text = pictures[indexPath.row]
        
        switch pictures[indexPath.row] {
        case "R&M1.jpg":
            cell.textLabel?.text = "Rick Sanchez"
        case "R&M2.jpg":
            cell.textLabel?.text = "Morty Smith"
        case "R&M3.jpg":
            cell.textLabel?.text = "Summer Smith"
        case "R&M4.jpg":
            cell.textLabel?.text = "Beth Smith"
        case "R&M5.jpg":
            cell.textLabel?.text = "Jerry Smith"
        case "R&M6.jpg":
            cell.textLabel?.text = "Birdperson"
        case "R&M7.jpg":
            cell.textLabel?.text = "Squanchy"
        case "R&M8.jpg":
            cell.textLabel?.text = "mr.Poopybutthole"
        case "R&M9.jpg":
            cell.textLabel?.text = "mr.Meeseeks"
        case "R&M10.jpg":
            cell.textLabel?.text = "Scary Terry"
        case "R&M11.jpg":
            cell.textLabel?.text = "Abradolf Lincler"
        case "R&M12.jpg":
            cell.textLabel?.text = "Lil' Bits"
        default:
            cell.textLabel?.text = "Something went wrong."
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

