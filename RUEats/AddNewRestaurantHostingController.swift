//
//  AddNewRestaurantHostingController.swift
//  RUEats
//
//  Created by Aryan Patel on 4/23/22.
//

import UIKit
import SwiftUI

class AddNewRestaurantVC: UIHostingController<AddNewRestaurantUI> {

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: AddNewRestaurantUI())
    }
}
