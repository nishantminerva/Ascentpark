//
//  ContentView.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 25/09/21.
//

import SwiftUI

class FetchToDo: ObservableObject {
  // 1.
  @Published var users = [User]()
     
    init() {
        let url = URL(string: "https://smileelive.webappfactory.co/api/demo-data")!
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let userData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode(Users.self, from: userData)
                    DispatchQueue.main.async { [self] in
                        users = decodedData.data
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}

struct ContentView: View {
    
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["house" , "globe" , "dot.radiowaves.left.and.right", "bell" , "pencil"]
    
    
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView{
                        Text("Frist")
                            .navigationTitle("Followers")
                    }
                case 1:
                    ScrollView{
                        Text("TEST")
                    }
                case 2:
                    NavigationView{
                        VStack {
                            Followers()
                            .padding()
                        }
                            .navigationTitle("Followers")
                    }
                    
                    
                default:
                    Text("Remaining")
                }
            }
            Spacer()
            
            HStack {
                ForEach(0..<4) { num in
                    Button(action: {
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        if num == 2 {
                            
                            ZStack{
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 60, height: 60)
                                VStack{
                                    Image(systemName: tabBarImageNames[num])
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.black)
                                    Text("Live")
                                        .foregroundColor(.black)
                                }
                            }
                            
                        }
                        else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black): .init(white: 0.8))
                        
                            
                        }
                        Spacer()
                    })
                }
                
                Button(action: { selectedIndex = 5 }, label:{
                    Spacer()
                    Profile()
                  Spacer()
                })
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
    }
}

struct Profile: View {
    var body: some View{
        ZStack{
        Circle()
            .fill(Color.pink)
            .frame(width: 40, height: 40)
        Image("Image")
            .resizable()
            .frame(width: 30, height: 30, alignment: .center)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(50)
            }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


