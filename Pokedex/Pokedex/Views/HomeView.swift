//
//  Login.swift
//  Pokedex
//
//  Created by Damian on 5/3/23.
//

import SwiftUI

struct HomeView: View {
        @State private var isOpen = false
        var body: some View {
            VStack{
                    ZStack {
                        PokedexView()
                        withAnimation(.spring()) {
                            Color.red
                                .frame(height: isOpen ? 0 : UIScreen.main.bounds.height / 2+40)
                                .clipShape(Rectangle().offset(y: isOpen ? -UIScreen.main.bounds.height / 2 - 20 : -UIScreen.main.bounds.height / 4 - 20))
                        }.edgesIgnoringSafeArea(.all)
                        
                        withAnimation(.spring()) {
                            Color(white: 0.85)
                                .frame(height: isOpen ? 0 : UIScreen.main.bounds.height / 2+40)
                                .clipShape(Rectangle().offset(y: isOpen ? UIScreen.main.bounds.height / 2 + 20 : UIScreen.main.bounds.height / 4 + 20))
                        }.edgesIgnoringSafeArea(.all)
                        Button(action: {
                            withAnimation {
                                self.isOpen.toggle()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                
                                Image("pokeball").resizable()
                                    .frame(width: 60, height: 60)
                                    .rotationEffect(.degrees(isOpen ? 360 : 0))
                                    .opacity(isOpen ? 0 : 1)
                                    .scaleEffect(isOpen ? 0.1 : 1)
                            }
                        }
                    }
            }
        }

}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
