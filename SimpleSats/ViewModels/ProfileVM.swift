//
//  ProfileViewModel.swift
//  SimpleSats
//
//  Created by Rovshan Rasulov on 26.06.25.
//

import UIKit

class ProfileVM {
    func saveImageToDocuments(image: UIImage, fileName: String) -> URL? {
        guard let data = image.jpegData(compressionQuality: 0.9) else { return nil }
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documents.appendingPathComponent(fileName)
        
        do{
            try data.write(to: fileURL)
            return fileURL
        }
        catch{
            print("Error: \(error)")
            return nil
        }
    }
    
    func loadImageForDocuments(fileName: String) -> UIImage? {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documents.appendingPathComponent(fileName)
        return UIImage(contentsOfFile: fileURL.path)
    }
}
