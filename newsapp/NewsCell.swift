//
//  NewsCell.swift
//  newsapp
//
//  Created by Duc Anh on 5/16/20.
//  Copyright © 2020 Duc Anh. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var articleImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var cellDetail: Docs! {

        didSet {
            headlineLabel.text = cellDetail.headline?.main
            headlineLabel.lineBreakMode = .byWordWrapping
            headlineLabel.numberOfLines = 2
            abstractLabel.text = cellDetail.abstract!
            abstractLabel.lineBreakMode = .byWordWrapping
            abstractLabel.numberOfLines = 5
            if let multimediaURL = cellDetail.multimedia.first?.url,
               let imgUrl = URL(string: "https://static01.nyt.com/\(multimediaURL)") {
//                   articleImg.kf.setImage(with: imgUrl)
                articleImg.load(url: imgUrl)
            }
//            guard let url = cellDetail.multimedia[0].url else {
//                print("found empty url here")
//                return
//            }
//
//            let imgUrl = URL(string: "https://static01.nyt.com/\(url)")
//            let imgUrl = URL(string: "https://static01.nyt.com/\(cellDetail.multimedia[1].url)!")
//            articleImg.kf.setImage(with: imgUrl)
//            articleImg.load(url: imgurl!)
//            print("Day la : ",cellDetail.multimedia[0)
        }
    }
//    var imgres: Response! {
//        didSet {
//            for doc in imgres.docs {
//                headlineLabel.text = doc.headline?.main
//                headlineLabel.lineBreakMode = .byWordWrapping
//                headlineLabel.numberOfLines = 2
//                abstractLabel.text = doc.abstract!
//                abstractLabel.lineBreakMode = .byWordWrapping
//                abstractLabel.numberOfLines = 5
//                let imgurl = URL(string: "https://static01.nyt.com/\(doc.multimedia[0].url)")
//                articleImg.kf.setImage(with: imgurl)
//            }
//        }
//    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
