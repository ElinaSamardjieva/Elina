//
//  DataManager.swift
//  Elina
//
//  Created by Elina Samardjieva on 4/14/16.
//  Copyright © 2016 Dea. All rights reserved.
//

import UIKit

private let _sharedInstance = DataManager()

class DataManager: NSObject {

    var dataArray = [
        "http://myinternetscout.com/wp-content/uploads/2013/09/20130920-Small-Size-Business-Internet-Strategy.png",
        "http://img.businessdictionary.com/article/small/category-small-business-7.jpg",
        "http://themuslimstartup.com/wp-content/uploads/2014/08/Great-Ideas-For-Business.jpg",
        "http://www.rjinvestment.co.uk/wp-content/uploads/2012/12/business-300px-300x200.jpg",
        "http://www.bizben.com/artwork/increasing-284.jpg",
        "http://www.mit.edu.au/sites/default/files/images/Business-01-optimised.jpg",
        "https://www.sunyocc.edu/uploadedImages/Images/Wide/Business%20feature.jpg",
        "http://420intel.com/sites/default/files/field/image/digital-business%5B1%5D.jpg",
        "http://www.applied-edu.com/en/wp-content/uploads/2016/03/What-is-a-Business-Plan-applied1.jpg",
        "http://www.cmunlimited.com/wp-content/uploads/2015/06/hand-world.jpg",
        "https://media.licdn.com/mpr/mpr/shrinknp_800_800/AAEAAQAAAAAAAAJhAAAAJGVmNTZjOWQ3LWYxYTktNDFlZC04Mzk3LTI3YzAyMjg0Yzk2Mw.jpg",
        "http://incedogroup.com/wp-content/uploads/2013/11/20131120-linda-pic-3-successful-business-strategies-2.jpg",
        "http://www.sgeb.bg/web/files/richeditor/business/business-depozit-tempo-capital.jpg",
        "http://h2mbusinesssolutions.com/wp-content/uploads/2015/01/h2m-business-solutions1.jpg",
        "http://www.apec.org/~/media/Files/Groups/EC/485778967.jpg?h=334&w=400",
        "http://www.apec.org/~/media/Files/Groups/ABAC/469631715.jpg?h=250&w=384",
        "http://www.talbotlaw.co.za/wp-content/uploads/2015/05/Commercial.jpg",
        "http://businessdevel.com/wp/wp-content/uploads/2013/03/business-development-growth3.jpg",
        "http://brandinginasia.com/wp-content/uploads/2015/10/Korea-Doing-business-in-Korea.jpg",
        "http://www.strath.ac.uk/media/1newwebsite/departmentsubject/business/Business_people_in_office.jpg",
        "http://nseop.org/wp-content/uploads/2016/02/business-strategy.jpg",
        "http://www.agenda-bg.com/wp-content/uploads/2016/03/img_business_solution.jpg",
        "http://www.velquest.com/wp-content/uploads/2015/06/business-intelligence-marketing-markets-and-it-service-management-requirements1.jpg",
        "http://sidelinetrainers.com/wp-content/uploads/2015/10/nline-Business-Opportunities.jpg",
        "http://www.bizzbeginnings.com/wp-content/uploads/2016/01/shutterstock_134284280_toppick_crop.jpg",
        "http://static2.businessinsider.com/image/56ba53f38b987dc44eef24a5/5-reasons-business-owners-should-never-stop-learning.jpg",
        "http://www.cloudsoftwareprogram.org/rs/374/e9c4455d-a317-4f4c-9f70-108d736bae98/412/filename/cloud-business.jpg",
        "http://onlinelearningtips.com/wp-content/uploads/2013/05/business-simulations-students.jpg",
        "http://blogs-images.forbes.com/learnvest/files/2014/09/side-business-grow.jpg"]
    
    class var sharedManager: DataManager {
        return _sharedInstance
    }
}
