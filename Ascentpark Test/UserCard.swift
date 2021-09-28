//
//  Followers.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 27/09/21.
//

import Foundation
import SwiftUI

struct UserCard : View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View{
        List(fetch.users) { item in
            VStack(alignment: .leading) {
                HStack{
                    ZStack{
                        //                        Profile picture in the FollowersCard
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 72, height: 72)
                        //                        CustomImage from Url.
                        CustomImageView(urlString: item.profile_picture) 
                            .frame(width: 69, height: 69, alignment: .center)
                    }
                    VStack{
                        HStack{
                            //                             Name
                            Text(item.first_name + " " + item.last_name)
                                .foregroundColor(.black)
                                .font(.custom("Poppins-SemiBold", size: 16))
                            Spacer()
                        }
                        HStack{
                            //                            UserName
                            Text("@" + item.user_name)
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.custom("Poppins-Regular", size: 10))
                            HStack{
                                //                                Followers Count
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
                                //                                Tags
                                Capsule()
                                    .fill(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                    .frame(height: 26, alignment: .trailing)
                                HStack{
                                    Spacer()
                                    ForEach(0..<4) { num in
                                        if num != 2 {
                            
                                            HStack{
                                            CustomImageView(urlString: item.followings.user_tags[num].tag.icon)
                                                .frame(width: 14, height: 14, alignment: .trailing)
                                            Text(item.followings.user_tags[num].tag.name)
                                                .foregroundColor(Color(.gray))
                                                .font(.custom("Raleway-Regular", size: 12))
                                                .frame(height: 14)
                                            }
                                            
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            
                        }
                    }
//                    .padding(.bottom, 15)
                    HStack{
                        Image("Plus")
                            .frame(width: 35, height: 35)
                    }
//                    Spacer()
                }
            }
            
        }
    }
}
