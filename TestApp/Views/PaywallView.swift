//
//  PaywallView.swift
//  TestApp
//
//  Created by Андрей Андриянов on 31.03.2025.
//

import Foundation
import SwiftUI

struct PaywallView: View {
    @State private var selectedRectangle: Int? = nil
    var body: some View {
        ZStack {
            Image("paywallImage")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        Image("backgroundShadowW")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                            .padding()
                        VStack {
                            VStack {
                                Text("Unreal videos with PRO")
                                    .font(.system(size: 28, weight: .bold))
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "chevron.right")
                                        Text("Access to full functionality")
                                    }
                                    .font(.system(size: 13, weight: .regular))
                                    HStack {
                                        Image(systemName: "chevron.right")
                                        Text("Unlimited browsing of stories")
                                    }
                                    .font(.system(size: 13, weight: .regular))
                                    HStack {
                                        Image(systemName: "chevron.right")
                                        Text("Unlimited image enhancement")
                                    }
                                    .font(.system(size: 13, weight: .regular))
                                }
                            }
                            VStack {
                                VStack {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color(hex: "#9D9C9C14"))
                                            .frame(width: 358, height: 72)
                                            .cornerRadius(12)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color(hex: "#C83E3E"), lineWidth: selectedRectangle == 1 ? 2 : 0)
                                            )
                                            .onTapGesture {
                                                selectedRectangle = 1
                                            }
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("Year")
                                                    .font(.system(size: 17, weight: .regular))
                                                Text("$19 per week")
                                                    .font(.system(size: 12, weight: .regular))
                                                    .foregroundStyle(Color(hex: "#8D929B"))
                                            }
                                            .padding()
                                            Spacer()
                                            VStack(alignment: .trailing) {
                                                Text("$19.99")
                                                    .font(.system(size: 17, weight: .bold))
                                                    .foregroundStyle(Color(hex: "#C83E3E"))
                                                Text("per week")
                                                    .font(.system(size: 12, weight: .regular))
                                                    .foregroundStyle(Color(hex: "#222222"))
                                            }
                                            .padding()
                                        }
                                        .padding()
                                        VStack {
                                            HStack {
                                                Spacer()
                                                Text("SAVE 40%")
                                                    .font(.system(size: 11, weight: .regular))
                                                    .foregroundColor(Color(hex: "#222222"))
                                                    .padding(.vertical, 4)
                                                    .padding(.horizontal, 12)
                                                    .background(Color(hex: "#FFE500"))
                                                    .cornerRadius(8)
                                                    .padding(.top, -10)
                                                    .padding(.trailing, 10)
                                            }
                                            Spacer()
                                        }
                                        .frame(width: 358, height: 72)
                                    }
                                }
                                VStack {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color(hex: "#9D9C9C14"))
                                            .frame(width: 358, height: 72)
                                            .cornerRadius(12)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color(hex: "#C83E3E"), lineWidth: selectedRectangle == 2 ? 2 : 0)
                                            )
                                            .onTapGesture {
                                                selectedRectangle = 2
                                            }
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("Weekly")
                                                    .font(.system(size: 17, weight: .regular))
                                                Text("$19 per week")
                                                    .font(.system(size: 12, weight: .regular))
                                                    .foregroundStyle(Color(hex: "#222222"))
                                            }
                                            .padding()
                                            Spacer()
                                            VStack(alignment: .trailing) {
                                                Text("$19.99")
                                                    .font(.system(size: 17, weight: .bold))
                                                    .foregroundStyle(Color(hex: "#222222"))
                                                Text("per week")
                                                    .font(.system(size: 12, weight: .regular))
                                                    .foregroundStyle(Color(hex: "#222222"))
                                            }
                                            .padding()
                                            
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color(hex: "#FFFFFFF0"))
                                .frame(width: UIScreen.main.bounds.width, height: 200)
  
                            VStack {
                                HStack {
                                    Image(systemName: "clock.arrow.circlepath")
                                    Text("Cancel Anytime")
                                }.foregroundStyle(Color(hex: "#8D929B"))
                                    .font(.system(size: 12, weight: .regular))
                                    .padding()
                            Button(action: {
                                if let selected = selectedRectangle {
                                    print("Выбран прямоугольник: \(selected)")
                                } else {
                                    print("Прямоугольник не выбран")
                                }
                            })
                            {
                                Text("Label")
                                    .foregroundStyle(Color(hex: "#FFFFFF"))
                                    .frame(width: 358, height: 48)
                                    .background(Color(hex: "#222222"))
                                    .cornerRadius(24)
                            }
                                HStack() {
                                    
                                    Text("Privacy Policy")
                                    Spacer()
                                    Text("Restore Purchases")
                                    Spacer()
                                    Text("Terms of Use")
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2)
                                .foregroundStyle(Color(hex: "#8D929B"))
                                .font(.system(size: 11, weight: .regular))
                                .padding()
                        }
                        }
                    }
                    
                }
                .onAppear() {
                    selectedRectangle = 1
                }
        }
    }
}
#Preview {
    PaywallView()
}
