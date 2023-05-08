//
//  TableViewController.swift
//  SeyahatKitabim
//
//  Created by Taha Turan on 8.05.2023.
//

import UIKit
import CoreData

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var titleArray = [String]()
    var idArray = [UUID]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
        getData()
       
    }
    
    func getData()  {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        request.returnsObjectsAsFaults = false
       
        do{
            let results = try    contex.fetch(request)
            
            if results.count > 0 {
                
                self.titleArray.removeAll()
                self.idArray.removeAll()
                
                for result in results as! [NSManagedObject]{
                    if let title = result.value(forKey: "title") as? String{
                        self.titleArray.append(title)
                        
                    }
                    if let id  = result.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    tableView.reloadData()
                }
                
                
            }
            
        }catch{
            print(error.localizedDescription)
        }
     
        
        
    }


}


extension TableViewController:UITableViewDelegate , UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
  @objc  func addButton()  {
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
}
