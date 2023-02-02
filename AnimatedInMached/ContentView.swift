//
//  ContentView.swift
//  AnimatedInMached
//
//  Created by Guru Mahan on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var isSelected:Bool = false
    @Namespace var nameSpace
    var body: some View {
        
        
            VStack {
                if !isSelected{
                    RoundedRectangle(cornerRadius: 20.0)
                        .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                        .frame(width:100,height: 100)
//                        .offset(y: isSelected ?  UIScreen.main.bounds.height * 0.75 : 0)
                }
                
                Spacer()
                if isSelected{
                    RoundedRectangle(cornerRadius: 20.0)
                        .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                        .frame(width:300,height: 200)
                }
              
            }
           
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color.red)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isSelected.toggle()
                }
                
            }
        }
       
    
}

struct ContentView1:View {
    @State var categories:[String] = ["Home","Office","State"]
    @State var selected: String = ""
    @Namespace var nameSpace1
    var body: some View{
        HStack{
                ForEach(categories, id: \.self) { category in
                    ZStack{
                        if selected == category{
                            RoundedRectangle(cornerRadius: 10)
                                 .fill(Color.red)
                                 .matchedGeometryEffect(id: "category", in: nameSpace1)
                                 .frame(width: 35,height: 2)
                                 .offset(y:10)
                        }
                   
                    Text(category)
                            .foregroundColor(selected == category ? .red : .black)
                }
                    .frame(maxWidth: .infinity)
                    .frame(height:55)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selected = category
                        }
                       
                    }
            }
            
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
