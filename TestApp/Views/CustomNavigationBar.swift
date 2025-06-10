import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    var leadingButtonAction: (() -> Void)?
    var trailingButtonAction: (() -> Void)?
    var trailingButton: AnyView?

    var body: some View {
        VStack {
            ZStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    if let leadingButtonAction = leadingButtonAction {
                        Button(action: leadingButtonAction) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color(hex: "#C83E3E"))
                                    .imageScale(.large)
                                Text("Back")
                                    .foregroundColor(Color(hex: "#C83E3E"))
                            }
                        }
                        .frame(width: 100, alignment: .leading)
                    } else {
                        Spacer().frame(width: 100)
                    }
                    Spacer()
                    if let trailingButtonAction = trailingButtonAction, let trailingButton = trailingButton {
                        Button(action: trailingButtonAction) {
                            trailingButton
                        }
                        .frame(width: 100, alignment: .trailing)
                    } else {
                        Spacer().frame(width: 100)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 44) 
            .background(Color.white)
        }
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(
            title: "Profile",
            leadingButtonAction: { print("Back button tapped") },
            trailingButtonAction: { print("Trailing button tapped") },
            trailingButton: AnyView(
                Image("proButton2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            )
        )
        .frame(height: 80)
    }
}
