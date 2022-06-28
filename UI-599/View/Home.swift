//
//  Home.swift
//  UI-599
//
//  Created by nyannyan0328 on 2022/06/28.
//

import SwiftUI
import PhotosUI

struct Home: View {
    @StateObject var model : PhotsPickerModel = .init()
    var body: some View {
        NavigationStack{
            VStack{
                
                
                if !model.loadImages.isEmpty{
                    
                    TabView{
                        
                        
                        ForEach(model.loadImages){image in
                            
                            image.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(height:300)
                }
                
            }
            .navigationTitle("Photos Picker")
            .toolbar {
            
                
                PhotosPicker(selection: $model.selectedPhot,matching: .all(of: [.images]),photoLibrary: .shared()) {
                    
                    Image(systemName: "photo.fill")
                        .font(.callout)
                    
                }
                
                PhotosPicker(selection: $model.selectedPhotos,matching: .any(of: [.images]),photoLibrary:.shared()) {
                    
                    Image(systemName: "photo.on.rectangle")
                        .font(.callout)
                    
                    
                }
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
