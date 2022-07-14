//
//  CustomAlert.swift
//  ToDo
//
//  Created by AmirDiafi on 7/13/22.
//

import SwiftUI

struct CustomAlert: View {
    var alertText: String
    var body: some View {
        VStack {
            Alert(title: Text(alertText))
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(alertText: "nothing")
    }
}
