//
//  Created by Dea Pamukchieva on 2/24/15.
//  Copyright (c) 2015 Digimark. All rights reserved.
//

import UIKit
//import SDWebImage

class ImageView: UIImageView, NSURLConnectionDataDelegate {
    
    var connection: NSURLConnection?
    var imageData: NSMutableData?
    var compress = false
    var newSize = CGSizeZero
    var name: String?
    var urlString: String?

    func loadImage(urlStr: String) {
        
        contentMode = .ScaleAspectFill
        clipsToBounds = true
        
        let url = NSURL(string: urlStr)
        if let url = url {
            name = url.lastPathComponent
            self.removeLoadingIndicator()
            
            if let connection = connection {
                connection.cancel()
            }
            
            if let savedImage = SDImageCache.sharedImageCache().imageFromMemoryCacheForKey(name) {
                self.image = savedImage
            } else {
                self.addLoadingIndicator();
            }
            
            connection = NSURLConnection(request: NSURLRequest(URL: url), delegate: self)
        }
    }
    
    // MARK: - NSURLConnectionDelegate
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        imageData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        if let imageData = imageData {
            imageData.appendData(data)
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        self.removeLoadingIndicator()
      //  loadImage(urlString!, shouldCompress: compress, size: newSize)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        self.removeLoadingIndicator()
        var img: UIImage?
        if let imageData = imageData {
            img = UIImage(data: imageData)
        }
        
        if let img = img {
            SDImageCache.sharedImageCache().storeImage(img, forKey: name)
                self.image = img
        }
    }
    
    // MARK: Private
    private func addLoadingIndicator() {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activityIndicator.color = UIColor.redColor()
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint = NSLayoutConstraint(item: activityIndicator, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        addConstraint(constraint)
        constraint = NSLayoutConstraint(item: activityIndicator, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        addConstraint(constraint)
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    private func calculateNewSize(image: UIImage?, size: CGSize) -> CGSize {
        if let image = image {
            let imageRatio = image.size.height/image.size.width
            return CGSizeMake(size.width*2, size.width*imageRatio*2)
        }
        
        return CGSizeZero
    }
    
    private func removeLoadingIndicator() {
        self.subviews.map(){$0.removeFromSuperview()}
    }

}