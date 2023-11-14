//
//  CardView.swift
//  phalik696
//
//  Created by user247821 on 11/13/23.
//

import Foundation
import SwiftUI
import Combine

struct CardView: View {
    var imageName: String
    var size: CGSize
   

    var body: some View {
        VStack {
            Image(imageName) // Replace with your actual image name
                .resizable()
                .scaledToFit()
                .frame(width: size.width * 0.35, height: size.height * 0.15)
               
        }
        .frame(width: size.width * 0.40, height: size.height * 0.2)
        .background(Color.white)
        .cornerRadius(size.width * 0.04)
        .shadow(radius: size.width * 0.03)
       
    }
}

