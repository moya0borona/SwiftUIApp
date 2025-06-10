

import SwiftUI

struct SettingsRow: View {
    var iconName: String
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: iconName)
                    .frame(width: 24, height: 24)
                Text(title)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 24, height: 24)
            }
            .foregroundColor(Color(hex: "#C83E3E"))
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(hex: "#9D9C9C14"))
            .cornerRadius(10)
        }
    }
}

struct SettingsView: View {
    @State private var showNotificationAlert = false
    @State private var showClearCacheAlert = false
    @State private var showRateAlert = false
    @State private var isSubscribed = false
    @State private var notificationsEnabled = false
    @State private var cacheSize = "5 MB"
    @State private var showPaywall = false
    @StateObject private var isPaidPro = PaidProState()
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Support us")
                ) {
                    SettingsRow(iconName: "star", title: "Rate app") {
                        print("Rate app / Открыть пейвол")
                        showRateAlert = true
                    }
                    .padding(.vertical, 8)
                    
                    SettingsRow(iconName: "square.and.arrow.up", title: "Share with friends") {
                        print("Открыть пейвол")
                        let appStoreLink = "https://apps.apple.com/app/id123456789"
                        let activityController = UIActivityViewController(activityItems: [appStoreLink], applicationActivities: nil)
                        UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .padding(.horizontal, 12)
                
                Section(header: Text("Purchases & Actions").font(.subheadline).foregroundColor(.gray)) {
                    if !isSubscribed {
                        SettingsRow(iconName: "sparkles", title: "Upgrade plan") {
                            showPaywall = true
                            print("Открыть пейвол")
                        }
                        .padding(.vertical, 8)
                    }
                    
                    HStack {
                        Image(systemName: "bell")
                        Text("Notifications")
                            .foregroundColor(.black)
                        Spacer()
                        Toggle("", isOn: $notificationsEnabled)
                            .onChange(of: notificationsEnabled) { oldValue, newValue in
                                if newValue {
                                    showNotificationAlert = true
                                }  else {
                                }
                            }
                    }  .foregroundColor(Color(hex: "#C83E3E"))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(Color(hex: "#9D9C9C14"))
                        .cornerRadius(10)
                    
                    Button(action: {
                        showClearCacheAlert = true
                    }) {
                        HStack {
                            
                            Image(systemName: "trash")
                            Text("Clear cache")
                                .foregroundColor(.black)
                            
                            Spacer()
                            HStack {
                                Text(cacheSize)
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                            }
                        }
                    }.foregroundColor(Color(hex: "#C83E3E"))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(Color(hex: "#9D9C9C14"))
                        .cornerRadius(10)
                        .padding(.vertical, 8)
                    SettingsRow(iconName: "arrow.clockwise.icloud", title: "Restore purchases") {
                        print("Восстановить покупки")
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .padding(.horizontal, 12)
                
                Section(header: Text("Info & legal").font(.subheadline).foregroundColor(.gray)) {
                    SettingsRow(iconName: "text.bubble", title: "Restore purchases") {
                        print("Restore purchases")
                        if let url = URL(string: "mailto:support@example.com") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .padding(.vertical, 8)
                    SettingsRow(iconName: "folder.badge.person.crop", title: "Privacy Policy") {
                        print("Privacy Policy")
                        if let url = URL(string: "https://example.com/privacy") {
                            UIApplication.shared.open(url)
                        }
                    }
                    SettingsRow(iconName: "doc.text", title: "Usage Policy") {
                        print("Usage Policy")
                        if let url = URL(string: "https://example.com/usage") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .padding(.vertical, 8)
                    HStack {
                        Spacer()
                        Text("App Version: 1.0.0")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(Color(hex: "#19191999"))
                        Spacer()
                    }
                    .padding()
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .padding(.horizontal, 12)
            }
            .padding(.bottom, 70)
            .listStyle(PlainListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !isSubscribed {
                        Button(action: {
                            showPaywall = true
                            print("Открыть пейвол")
                        }) {
                            Image("proButton")
                                .resizable().scaledToFit()
                                .frame(width: 82, height: 32)
                        }
                    }
                }
            }
            
            .alert(isPresented: $showNotificationAlert) {
                Alert(
                    title: Text("Allow notifications?"),
                    message: Text("This app will be able to send you messages in your notification center"),
                    primaryButton: .default(Text("Allow")) {
                        print("Уведомления включены")
                    },
                    secondaryButton: .cancel(Text("Cancel")) {
                        notificationsEnabled = false
                    }
                )
            }
            .alert(isPresented: $showClearCacheAlert) {
                Alert(
                    title: Text("Clear cache?"),
                    message: Text("The cached files of your videos will be deleted from your phone's memory. But your download history will be retained."),
                    primaryButton: .destructive(Text("Clear")) {
                        // Логика очистки кеша
                        print("Кеш очищен")
                    },
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
            .alert(isPresented: $showRateAlert) {
                Alert(
                    title: Text("Rate AppName"),
                    message: Text("Tap a star to rate it on the App Store."),
                    primaryButton: .default(Text("OK")) {
                        // Логика открытия App Store для оценки
                        print("Открыть оценку в App Store")
                    },
                    secondaryButton: .cancel(Text("Not now"))
                )
            }
        }.sheet(isPresented: $showPaywall) {
            PaywallView()
        }
    }
}

#Preview {
    SettingsView()
}
