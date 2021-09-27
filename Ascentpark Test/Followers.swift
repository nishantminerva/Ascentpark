//
//  Followers.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 27/09/21.
//

import Foundation
import SwiftUI

struct Followers : View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View{
        List(fetch.users) { item in
            VStack(alignment: .leading) {
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 80, height: 80)
                        CustomImageView(urlString: item.profile_picture) // This is where you extract urlString from Model ( transaction.imageUrl)
                            .frame(width: 70, height: 70, alignment: .center)
                    }
                    VStack{
                        HStack{
                            Text(item.first_name + " " + item.last_name)
                                .foregroundColor(.black)
                                .font(.system(size: 20 , weight: .bold))
                            Spacer()
                        }
                        HStack{
                            Text(item.user_name)
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.system(size: 12))
                            Text(String(item.follow) + " followers")
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.system(size: 12))
                            Spacer()
                        }
                        HStack{
                            ForEach(0..<4) { num in
                                CustomImageView(urlString: item.followings.user_tags[num].tag.icon)
                                    .frame(width: 10, height: 10, alignment: .center)
                                Text(item.followings.user_tags[num].tag.name)
                                    .foregroundColor(Color(.tertiaryLabel))
                                    .font(.system(size: 8))
                                Spacer()
                            }
                        }
                    }
                    .padding(.bottom, 15)
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 40, height: 40)
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
