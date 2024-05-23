//
//  CircleImage.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable() // Menambahkan resizable untuk memastikan gambar bisa diubah ukurannya
            .scaledToFill()
    }
}

#Preview {
    CircleImage(image: Image("tanaman1"))
}
