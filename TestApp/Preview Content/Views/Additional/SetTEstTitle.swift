import SwiftUI


struct SettingsView2: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Фиксированный большой заголовок
                HStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.top, 100) // Отступ от верхнего края
                
                // Контент с прокруткой
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(1..<20) { index in
                            Text("Настройка \(index)")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
            .ignoresSafeArea(edges: .top) // Убираем баг с отступами
        }
    }
}


#Preview {
    SettingsView2()
}
