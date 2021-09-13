//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/09/13.
//

import SwiftUI

struct Home: View {
    
    @State var isConnected = false
    
    @State var currentServer : Server = severs.first!
    
    @State var changeServer = false
    
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "circle.grid.cross")
                        .font(.title)
                        .padding(15)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.white.opacity(0.25),lineWidth: 2)
                        
                        
                        )
                    
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "slider.horizontal.3")
                        .font(.title)
                        .padding(15)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.white.opacity(0.25),lineWidth: 2)
                        
                        
                        )
                    
                }

                
                
                
                
                
            }
            .overlay(
            
            Text(getTitle())
            
            )
            .foregroundColor(.white)
            
            powerButton()
            
            VStack{
                
                Label {
                    
                    Text(isConnected ? "Connected" : "NotConnected")
                    
                } icon: {
                    
                    Image(systemName: isConnected ? "checkmark.shield.fill" : "shield.slash")
                    
                }
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
                
                
                
                HStack{
                    
                        HStack{
                            
                            Image(systemName:"arrow.down.to.line.circle")
                                .font(.title)
                                .foregroundColor(.white)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Download")
                                    .foregroundColor(.gray)
                                Text("60.0KB/s")
                                    .foregroundColor(.white)
                                
                            }
                            
                            
                            
                        }
                    
                    Spacer()
                    
                    
                    HStack{
                        
                        Image(systemName:"arrow.up.to.line.circle")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Upload")
                                .foregroundColor(.gray)
                            Text("275.0KB/s")
                                .foregroundColor(.white)
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                        
                    
                    
                }
                .padding(.horizontal)
                .padding(.top,10)
                .frame(width: getScreenBounds().width - 100)

                
                
                
            }
            .padding(.top,15)
           
           
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .overlay(
        
        Rectangle()
            .fill(.ultraThinMaterial)
            .opacity(changeServer ? 1 : 0)
            .ignoresSafeArea()
            .onTapGesture {
                changeServer.toggle()
            }
        
        
        )
        .overlay(bottomView(),alignment: .bottom)
        .ignoresSafeArea(.container, edges: .bottom)
        .background(
            
          backGroundView()
          
        
        )
    }
    
    
    @ViewBuilder
    func bottomView()->some View{
        
        VStack(spacing:0){
            
            HStack{
                
                
                Image(currentServer.flag)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(currentServer.name)
                        .font(.caption.bold())
                    
                    Text(isConnected ? "Cuntry Connected" : "Not Connected")
                    
                    
                }
                 .foregroundColor(.white)
              
                
                Spacer(minLength: 10)
                
                
                Button {
                    
                    withAnimation{
                        
                        changeServer.toggle()
                       
                       
                    }
                    
                } label: {
                    
                    Text(changeServer ? "Exit" : "Change")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 110, height: 50)
                        .background(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white,lineWidth: 2)
                        )
                    
                    
                    
                    
                }

                
                
                
            }
            .frame(height: 50)
            .padding(.horizontal)
            
            Divider()
                .padding(.top)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    ForEach(severs.filter{
                        
                        
                        $0.id != currentServer.id
                        
                        
                        
                    }){server in
                        
                        
                        VStack{
                            
                            HStack{
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    
                                    HStack{
                                        
                                        
                                        Image(server.flag)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                    }
                                    
                                    Label {
                                        
                                        Text("Avairable ping 992ms")
                                        
                                    } icon: {
                                        Image(systemName: "checkmark")
                                    }
                                    .font(.caption2)
                                    .foregroundColor(.green.opacity(0.6))
                                    
                                    

                                    
                                }
                                
                                
                                Spacer(minLength: 0)
                                
                                
                                
                                Button {
                                    
                                    withAnimation{
                                        
                                        
                                        changeServer.toggle()
                                        isConnected = false
                                        currentServer = server
                                        
                                        
                                        
                                    }
                                } label: {
                                    
                                    Text("Change")
                                        .font(.callout.bold())
                                        .foregroundColor(.white)
                                        .frame(width: 110, height: 40)
                                        .background(
                                        
                                            ZStack{
                                                
                                                RoundedRectangle(cornerRadius: 15)
                                                    .strokeBorder(.white,lineWidth: 2)
                                                
                                                
                                                
                                                
                                            }
                                        
                                        
                                        )
                                    
                                }
                                
                                
                                Button {
                                    
                                 
                                } label: {
                                    
                                    Image(systemName: "square.and.arrow.up.fill")
                                        .font(.callout.bold())
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 40)
                                        .background(
                                        
                                            ZStack{
                                                
                                                RoundedRectangle(cornerRadius: 15)
                                                    .strokeBorder(.white,lineWidth: 2)
                                                
                                                
                                                
                                                
                                            }
                                        
                                        
                                        )
                                    
                                }

                                
                                
                            }
                            .frame(height: 50)
                            .padding(.horizontal)
                            
                            Divider()
                                .background(.white)
                            
                           
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                }
                .padding(.top,25)
                .padding(.bottom,getSafeArea().bottom)
                
                
                
                
            }
              
            
            
            
            
        }
      
        .frame(maxWidth: .infinity)
        .frame(height: getScreenBounds().height / 2.7, alignment: .top)
        .padding()
        .background(
        
        Color("BottomSheet")
            .clipShape(CustomShape(radius: 35, corner: [.topLeft,.topRight]))
        
        )
        .offset(y:changeServer ? 0 : (getScreenBounds().height / 2.7) - (50 + getSafeArea().bottom))
        
        
        
        
    }
    
    @ViewBuilder
    func backGroundView()->some View{
        
        ZStack{
    
        LinearGradient(colors: [
            
            Color("BG1"),
            Color("BG1"),
            Color("BG2"),
            Color("BG2"),
        
        
        ], startPoint: .top, endPoint: .bottom)
            
            
            
            let stars : [CGPoint] = [
            
            
                CGPoint(x: 80, y: 230),
                CGPoint(x: 33, y: 100),
                CGPoint(x: 300, y: 300),
                CGPoint(x: 180, y: 350),
                CGPoint(x: 400, y: 400),
            
            ]
            
            
            
            ForEach(stars,id:\.x){star in
                
                
                Circle()
                    .fill(.white)
                    .frame(width: 8, height: 8)
                    .position(star)
                    .opacity(0.7)
                
            }
            
            
        Image("mars")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .opacity(0.7)
                .position(x: 50, y:220)
            
            
            
            
            Image("globe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getScreenBounds().width, height: getScreenBounds().width)
                .scaleEffect(1.5)
                .offset(y: 300)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            
        }
            .ignoresSafeArea()
        
        
        
        
    }
    
    
    @ViewBuilder
    func powerButton()->some View{
        
        Button {
            
            withAnimation{
                
                isConnected.toggle()
            }
            
        } label: {
            
            ZStack{
                
                Image(systemName: "power")
                    .font(.system(size: 65, weight: .bold))
                    .foregroundColor(.white)
                    .scaleEffect(isConnected ? 0.6 : 1)
                    .offset(y:isConnected ? -30 : 0)
                
                Text("DISSCONNECT")
                    .fontWeight(.bold)
                    .opacity(isConnected ? 1 : 0)
                    .offset(y: 20)
                    
            }
            
            
        }
       
        .frame(width: 190, height: 190)
        .background(
        
        
            ZStack{
                
                
                
                Circle()
                    .trim(from:isConnected ? 0 : 0.3, to:isConnected ? 1 : 0.4)
                    .stroke(
                    
                    LinearGradient(colors: [
                        
                        
                        Color("Ring1"),
                        Color("Ring1").opacity(0.5),
                        Color("Ring1").opacity(0.3),
                        Color("Ring1").opacity(0.2),
                        
                    
                    ], startPoint: .leading, endPoint: .trailing)
                    
                    ,style: StrokeStyle(lineWidth: 11, lineCap: .round, lineJoin: .round)
                    )
                    .shadow(color: Color("Ring1"), radius: 5, x: 1, y: -5)
                
                
                
                Circle()
                    .trim(from:isConnected ? 0 : 0.3, to:isConnected ? 1 : 0.4)
                    .stroke(
                    
                    LinearGradient(colors: [
                        
                        
                        Color("Ring2"),
                        Color("Ring2").opacity(0.5),
                        Color("Ring2").opacity(0.3),
                        Color("Ring2").opacity(0.2),
                        
                    
                    ], startPoint: .leading, endPoint: .trailing)
                    
                    ,style: StrokeStyle(lineWidth: 11, lineCap: .round, lineJoin: .round)
                    )
                    .shadow(color: Color("Ring2"), radius: 5, x: 1, y: -5)
                    .rotationEffect(.degrees(160))
                
                
                
                
            }
              
        
        )
        .padding(.top)
        
        

        
        
    }
    
    func getTitle()->AttributedString{
        
        var str = AttributedString("MICOVPN")
        
        
        if let range = str.range(of: "MICO"){
            
            str[range].font = .system(size: 25, weight: .bold)
            
            
        }
        
        if let range = str.range(of: "VPN"){
            
            
            str[range].font = .system(size: 25, weight: .thin)
        }
        
        
            
        
        
        return str
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
extension View{
    
    
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets{
        
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return .zero
            
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            
            
            return .zero
        }
        return safeArea
        
        
        
    }
    

    
}
