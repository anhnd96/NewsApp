//
//  ViewController.swift
//  newsapp
//
//  Created by Duc Anh on 5/1/20.
//  Copyright © 2020 Duc Anh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UITextFieldDelegate {
    var articles: [Docs] = []
    let searchmenu: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tablecontainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let textsearch: UISearchBar = {
        let text = UISearchBar()
        text.translatesAutoresizingMaskIntoConstraints = false
//        text.borderStyle = .roundedRect
//        text.textAlignment = .left
        return text
        
    }()
    let datefilter: UITextField = {
        let datepicker = UITextField()
        datepicker.translatesAutoresizingMaskIntoConstraints = false
        datepicker.borderStyle = .roundedRect
        datepicker.textAlignment = .center
        datepicker.tintColor = .clear
//        datepicker.datePickerMode = .date
        return datepicker
    }()
    let contenttable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuplayout()
        createDatePicker()
        datefilter.delegate = self
        loadData()
        contenttable.delegate = self
        contenttable.dataSource = self
        contenttable.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        // Do any additional setup after loading the view.
    }
    let datePicker = UIDatePicker()
    func setuplayout () {
        
        view.addSubview(searchmenu)
        searchmenu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchmenu.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchmenu.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchmenu.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        searchmenu.addSubview(textsearch)
        textsearch.topAnchor.constraint(equalTo: searchmenu.topAnchor, constant: 55).isActive = true
        textsearch.leftAnchor.constraint(equalTo: searchmenu.leftAnchor, constant: 40).isActive = true
        textsearch.rightAnchor.constraint(equalTo: searchmenu.rightAnchor, constant: -40).isActive = true
        textsearch.bottomAnchor.constraint(equalTo: searchmenu.topAnchor, constant: 85).isActive = true
        
        searchmenu.addSubview(datefilter)
        datefilter.topAnchor.constraint(equalTo: textsearch.bottomAnchor, constant: 5).isActive = true
        datefilter.leftAnchor.constraint(equalTo: searchmenu.leftAnchor, constant: 60).isActive = true
        datefilter.rightAnchor.constraint(equalTo: searchmenu.rightAnchor, constant: -60).isActive = true
        datefilter.bottomAnchor.constraint(equalTo: searchmenu.bottomAnchor, constant: -5).isActive = true
        
        view.addSubview(tablecontainer)
        tablecontainer.topAnchor.constraint(equalTo: searchmenu.bottomAnchor).isActive = true
        tablecontainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tablecontainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tablecontainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tablecontainer.addSubview(contenttable)
        contenttable.topAnchor.constraint(equalTo: tablecontainer.topAnchor, constant: 0).isActive = true
        contenttable.leftAnchor.constraint(equalTo: tablecontainer.leftAnchor,constant: 0).isActive = true
        contenttable.rightAnchor.constraint(equalTo: tablecontainer.rightAnchor, constant: 0).isActive = true
        contenttable.bottomAnchor.constraint(equalTo: tablecontainer.bottomAnchor, constant: 0).isActive = true
        
        
    }
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButt = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButt], animated: true)
        datefilter.inputAccessoryView = toolbar
        datefilter.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        datefilter.text = formatter.string(from: datePicker.date)
//        datefilter.text = "\(datePicker.date)"
        self.view.endEditing(true)
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == datefilter  {
//            return false
//        }
//        return true
//    }
//
    func loadData() {
        let p = [	
            "q" : "putin",
            "api-key" : "fbi7VSYnyr75xLH2RJntGUpPZdpGfgiy"
        ]
//        let q = "pelosi"
//        let apikey = "fbi7VSYnyr75xLH2RJntGUpPZdpGfgiy"
        let urla = "https://api.nytimes.com/svc/search/v2/articlesearch.json"
//            ?q=\(q)&api-key=\(apikey)"
        AF.request(urla, method: .get, parameters: p).responseObject{ (response: DataResponse<Base,AFError>) in
            let baseResponse = response.value
            if baseResponse?.status == "OK" {
                if let res = baseResponse?.response {
                    self.articles = res.docs
                    self.contenttable.reloadData()
                }
            }
            
        }
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.cellDetail = articles[indexPath.row]
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
