//
//  ContentView.swift
//  clone
//
//  Created by Ngô Nam on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            VStack {
                Header()
                Spacer()
                productview()
                Spacer()
                shopOptions()
            }
        }
    }
}

struct searchBar: View {
    @Binding var isVisible: Bool
    @State private var searchText = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1.5))
            }
            .padding()
        }
    }
}

struct Header: View {
    @State private var showInfo = false
    @State private var showSearchBar = false
    var body: some View {
        HStack {
            HStack {
                Image(systemName: showInfo ? "person.fill" : "person")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                
                if showInfo {
                    Text("Ngo Nam")
                        .font(.system(size: 22))
                }
            }
            .onTapGesture {
                withAnimation {
                    showInfo.toggle()
                    showSearchBar = false
                }
            }
            
            Spacer()
            
            if showSearchBar {
                searchBar(isVisible: $showSearchBar)
                    .transition(.move(edge: .top))
            }
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
                .onTapGesture {
                    withAnimation {
                        showSearchBar.toggle()
                        showInfo = false
                    }
                }
            
            Spacer()
                .frame(width: 30, height: 0)
            
            Image(systemName: "envelope")
                .resizable()
                .frame(width: 30, height: 23)
                .foregroundColor(.black)
        }
        .padding(15)
    }
}

struct productview: View {
    @State private var orChair = false
    @State private var orChairAni = false
    @State private var blChair = true
    @State private var blChairAni = false
    @State private var ylChair = false
    @State private var ylChairAni = false
    
    var body: some View {
        HStack {
            ZStack {
                Ellipse()
                    .frame(width: 300, height: 70)
                    .offset(y:170)
                    .blur(radius: 20)
                    .opacity(0.5)
                
                if orChair {
                    Image("orchair")
                        .resizable()
                        .frame(width: 340, height: 400)
                        .opacity(orChairAni ? 1 : 0)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 0.5).repeatCount(1)) {
                                blChairAni = false
                                orChairAni = true
                                ylChairAni = false
                            }
                        }
                }
                
                if blChair {
                    Image("blchair")
                        .resizable()
                        .frame(width: 340, height: 400)
                        .opacity(blChairAni ? 1 : 0)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 0.5).repeatCount(1)) {
                                blChairAni = true
                                orChairAni = false
                                ylChairAni = false
                            }
                        }
                }
                
                if ylChair {
                    Image("ylchair")
                        .resizable()
                        .frame(width: 340, height: 400)
                        .opacity(ylChairAni ? 1 : 0)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 0.5).repeatCount(1)) {
                                blChairAni = false
                                orChairAni = false
                                ylChairAni = true
                            }
                        }
                }
            }
            
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("or"))
                    .onTapGesture {
                        withAnimation {
                            orChair = true
                            blChair = false
                            ylChair = false
                        }
                    }
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("bl"))
                    .onTapGesture {
                        withAnimation {
                            blChair = true
                            orChair = false
                            ylChair = false
                        }
                    }
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("yl"))
                    .onTapGesture {
                        withAnimation {
                            ylChair = true
                            orChair = false
                            blChair = false
                        }
                    }
            }
        }
    }
}

struct shopOptions: View {
    @State private var isFavorite = false
    @State private var cartCount = 1
    @State private var price = 350
    
    let intro = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tincidunt et metus mattis auctor."
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 400, height: 320)
                .offset(x: 0, y: 50)
                .foregroundColor(.black)
            
            VStack {
                HStack {
                    Text("Fancy chair")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.title)
                        .frame(width: 30, height: 28)
                        .foregroundColor(isFavorite ? .red : .white)
                        .onTapGesture {
                            withAnimation {
                                isFavorite.toggle()
                            }
                        }
                }
                .offset(x: 0, y: 70)
                .padding(20)
                
                Spacer()
                
                Text(intro)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                    .padding()
                    .offset(x: 0, y: 25)
                
                Spacer()
                
                HStack {
                    Button {
                        if cartCount >= 1 {
                            cartCount -= 1
                        } else {
                            cartCount = 0
                        }
                    } label: {
                        Text("-")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(5)
                    }
                    
                    Text("\(cartCount)")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .padding()
                    
                    Button {
                        cartCount += 1
                    } label: {
                        Text("+")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(5)
                    }
                    
                    Spacer()
                    
                    Text("\(price * cartCount) $")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
