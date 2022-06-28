//
//  PhotsPickerModel.swift
//  UI-599
//
//  Created by nyannyan0328 on 2022/06/28.
//

import SwiftUI
import PhotosUI

class PhotsPickerModel: ObservableObject {
    @Published var loadImages : [MediaFile] = []
    
    @Published var selectedPhot : PhotosPickerItem?{
        
        didSet{
            
            if let selectedPhot{
                
                
                processPhoto(phot: selectedPhot)
            }
        }
    }
    
    @Published var selectedPhotos : [PhotosPickerItem] = []{
        
        didSet{
            
            for photo in selectedPhotos{
                
                processPhoto(phot: photo)
                
                
            }
        }
        
    }
    func processPhoto(phot : PhotosPickerItem){
        
        phot.loadTransferable(type: Data.self) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let data):
                    if let data,let image = UIImage(data: data){
                        
                        
                        self.loadImages.append(.init(image: Image(uiImage: image), data: data))
                    }
                    
                    
                case .failure(let failure):
                    print(failure)
                }
                
            }
        }
        
    }
}


