//
//  CustomImageView.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 27/09/21.
//

import Foundation
import SwiftUI

struct CustomImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame(width: 70, height: 70, alignment: .center)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(50)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
    }
}
