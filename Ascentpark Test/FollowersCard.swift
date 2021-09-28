//
//  Followers.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 27/09/21.
//

import Foundation
import SwiftUI

struct FollowersCard : View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View{
        List(fetch.users) { item in
            VStack(alignment: .leading) {
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 72, height: 72)
                        CustomImageView(urlString: item.profile_picture) // This is where you extract urlString from Model ( transaction.imageUrl)
                            .frame(width: 69, height: 69, alignment: .center)
                    }
                    VStack{
                        HStack{
                            Text(item.first_name + " " + item.last_name)
                                .foregroundColor(.black)
                                .font(.custom("Poppins-SemiBold", size: 16))
                            Spacer()
                        }
                        HStack{
                            Text("@" + item.user_name)
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.custom("Poppins-Regular", size: 10))
                            HStack{
                            Text("" + String(item.follow))
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.custom("Poppins-Bold", size: 10))
                            Text("followers")
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.custom("Poppins-Regular", size: 10))
                            }
                            Spacer()
                        }
                        HStack{
                            ZStack{
                                Capsule()
                                    .fill(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                    .frame(width: 200, height: 25)
                                HStack{
                                ForEach(0..<4) { num in
                                    if num != 2 {
                                        CustomImageView(urlString: item.followings.user_tags[num].tag.icon)
                                            .frame(width: 14, height: 14, alignment: .leading)
                                        Text(item.followings.user_tags[num].tag.name)
                                            .foregroundColor(Color(.gray))
                                            .font(.custom("Raleway-Regular", size: 12))
                                        Spacer()
                                    }
                                    
                                }
                                }
                            }
                            
                        }
                    }
                    .padding(.bottom, 15)
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 35, height: 35)
                            Image(systemName: "person.badge.plus")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.pink)
                        }
                    }
                    Spacer()
                }
            }
            
        }
    }
}
