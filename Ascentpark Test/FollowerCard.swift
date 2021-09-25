//
//  Followers.swift
//  Ascentpark Test
//
//  Created by Nishant Kumar on 25/09/21.
//

import Foundation
import SwiftUI

struct FollowerCard: View {
    var body: some View{
        VStack{
                HStack{
             ZStack{
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 80, height: 80)
                    Image("Image")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(50)
                        }
                    VStack{
                        HStack{
                            Text("Nishant Minerva")
                                .foregroundColor(.black)
                                .font(.system(size: 20 , weight: .bold))
                            Spacer()
                        }
                        HStack{
                            Text("@nishantminerva")
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.system(size: 12))
                            Text("246 followers")
                                .foregroundColor(Color(.secondaryLabel))
                                .font(.system(size: 12))
                            Spacer()
                        }
                        HStack{
                            Text("Celebrity")
                                .foregroundColor(Color(.tertiaryLabel))
                                .font(.system(size: 14))
                            Text("VIP")
                                .foregroundColor(Color(.tertiaryLabel))
                                .font(.system(size: 14))
                            Text("VVIP")
                                .foregroundColor(Color(.tertiaryLabel))
                                .font(.system(size: 14))
                            Spacer()
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
        .padding()
    }
}

