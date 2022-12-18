//
//  Main.swift
//  Test
//
//  Created by Mikhail Chudaev on 09.12.2022.
//

import SwiftUI

struct Main: View {
    
    @State var searchText: String = ""
    @Binding var text: String
    
    @StateObject var viewModel = ViewModelHotSales()
    
    var body: some View {
        ZStack {
            
            ScrollView(.vertical) {
                
                HStack {
                    Text("Select category")
                        .padding(.leading, 10)
                        .bold()
                    Spacer()
                    Text("view all")
                        .padding(.trailing, 10)
                }
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(categoriesResponse[0..<categoriesResponse.count], id: \.self) { categories in
                                SelectCategoriesCell(categories: categories, content: categories.title, image: categories.image)
                                    .aspectRatio(2/3, contentMode: .fit)
                            }
                        }
                        .padding(.leading, 10)
                    }
                }
                .foregroundColor(.clear)
                
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.orange)
                        
                        TextField("Search", text: $searchText)
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray)
                    )
                    .padding(.leading,25)
                    
                    ZStack {
                        let shape = RoundedRectangle(cornerRadius: 50)
                        shape
                            .fill()
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 50, alignment: .center)
                        Image("q")
                            .aspectRatio(contentMode: .fit)
                            .padding(1)
                    }
                }
                
                HStack {
                    Text("Hot sales")
                        .padding(.leading, 10)
                        .bold()
                    Spacer()
                    Text("see more")
                        .padding(.trailing, 10)
                }
                
                ScrollView(.horizontal) {
                    VStack {
                        
                        HStack {
                            ForEach(viewModel.homeStore[0..<viewModel.homeStore.count], id: \.self) { homeStore in
                                
                                HStack {
                                    
                                    ZStack {
                                        URLImage(urlString: homeStore.picture)
                                            .padding()
                                        
                                        if homeStore.isNew == true {
                                            ZStack {
                                                let shape = RoundedRectangle(cornerRadius: 50)
                                                shape
                                                    .fill()
                                                    .foregroundColor(.orange)
                                                    .frame(width: 50, height: 50)
                                                
                                                Text("New")
                                            }
                                            
                                            VStack {
                                                Text(homeStore.title)
                                                    .padding()
                                                    .foregroundColor(.white)
                                                Text(homeStore.subtitle)
                                                    .padding()
                                                    .foregroundColor(.white)
                                                
                                                Button {
                                                    print("main")
                                                } label: {
                                                    Text("Buy now!")
                                                }
                                                .frame(width: 200, height: 40)
                                                .background(Color.blue)
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .foregroundColor(.white)
                                            }
                                        } else {
                                            
                                            VStack {
                                                Text(homeStore.title)
                                                    .padding()
                                                    .foregroundColor(.white)
                                                Text(homeStore.subtitle)
                                                    .padding()
                                                    .foregroundColor(.white)
                                                
                                                Button {
                                                    print("main")
                                                } label: {
                                                    Text("Buy now!")
                                                }
                                                .frame(width: 200, height: 40)
                                                .background(Color.blue)
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .foregroundColor(.white)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .onAppear {
                        viewModel.fetch()
                    }
                }
                HStack {
                    Text("Best seller")
                        .padding(.leading, 10)
                    Spacer()
                    Text("see more")
                        .padding(.trailing, 10)
                }
                
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    BestSellerCell()
                }
                
                Text("")
                    .navigationTitle("Title")
                    .navigationBarBackButtonHidden()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                print("Refresh")
                            }) {
                                Label("", image: "filter")
                            }
                        }
                    }
                Spacer()
            }
        }
        TabbarCell()
            .frame(height: 60)
            .padding()
    }
}


struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(text: .constant(""))
    }
}
