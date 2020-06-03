//
//  PersonTableViewController.swift
//  SecureDB
//
//  Created by Esmeraldi Bejolli on 02/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import UIKit

class PersonTableViewController: UITableViewController {
    var personModel: [PersonModel?] = []
    let container = AppDelegate.shared.persistentContainer;
    
    @IBOutlet weak var addPeople: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personModel.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personTableCell", for: indexPath) as! PersonViewCell
        
        cell.name.text = personModel[indexPath.row]?.name
        cell.lastName.text = personModel[indexPath.row]?.lastName
        return cell
    }
  

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
    }
    
    @IBAction func addPerson(_ sender: Any) {
      
        PersonController.setPerson(viewContext: container.viewContext)
        
        do {
            try AppDelegate.shared.persistentContainer.viewContext.save()
            loadData()
            tableView.reloadData()
        } catch {
            print("person Cant be saved")
        }
    }
    
    func loadData() {
        personModel = []
        do {
            let persons = try AppDelegate.shared.persistentContainer.viewContext.fetch(Person.fetchRequest())
            for person in persons {
                personModel.append(personMapToModel(person: person as! Person))
            }
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
}
