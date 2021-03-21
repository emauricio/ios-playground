//
//  BioLogin.swift
//  Kitchensink
//
//  Created by Efren Mauricio on 2021/03/20.
//

import SwiftUI
import LocalAuthentication

struct BioLogin: View {
    @State var isUnlocked = false

    func authenticate() {
        let context = LAContext()
        var error: NSError?
        let reason = "Log in to your account"

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        isUnlocked=true
                    } else {
                        isUnlocked=false
                        print("Error")
                    }
                }
            }

        }else {
            print("no biometrics")
        }
    }
    let capooIn = "bclovenbg"
    let capooOut = "https://media.giphy.com/media/SVkhYVCi8fKPKvypi6/giphy.gif"
    var body: some View {
        VStack(alignment: .center){
            if isUnlocked {
                Image(capooIn)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            } else {
                Image(uiImage: capooOut.load())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
        }.onAppear(perform: authenticate)


    }
}

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else { return UIImage() }
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {

        }
        return UIImage()
    }
}

struct BioLogin_Previews: PreviewProvider {
    static var previews: some View {
        BioLogin(isUnlocked: false)
    }
}
