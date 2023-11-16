//
//  PaimentView.swift
//  transporttt
//
//  Created by haffa dhifi on 16/11/2023.
//
import SwiftUI


struct PaimentView: View {
   // @Binding var user: User
    //@Binding var selectedPhoneNumber: String
    //@Binding var discountCode: Double
    
    var body: some View {
        VStack(alignment : .leading,spacing:20){
           
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity) // Make the field wider
                
                HStack {
                    Image("paypal")
                        .font(.system(size: 24))
                        .padding(.leading, 16)
                
                        Text("Email: example@example.com")
                            .padding(.trailing, 16)
                        
                    
                    Spacer()
                }
            }
            
            
            
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity) // Make the field wider
                
                HStack (spacing: 20){
                        Image("mastercard")
                            .font(.system(size: 24))
                        
                        
                        VStack(alignment: .leading,spacing:15){
                            Text("*****35322565")
                                .padding(.trailing, 16)
                            
                            Text("Email: express on 21")
                                .foregroundColor(.gray)
                                .padding(.bottom, 16)
                        }
                        
                        
                    }.padding()
                
                    
                
            }
            Button(action: {
                // Handle the action when the button is tapped
            }) {
                
                Section {
                    NavigationLink(destination: addCardview()) {
                        Text("Add Card +")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.blue.opacity(0.25)) // Light blue background with opacity
                            .foregroundColor(Color.blue) // Blue text color
                            .cornerRadius(20)
                    }}
            }
           
                Text("Other methods")
                    .font(.system(size: 16, weight: .semibold))
            
            
            
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity) // Make the field wider
                
                HStack (spacing:20){
                    Image("cash")
                        .font(.system(size: 24))
                        .padding(16)
                    VStack(alignment: .leading,spacing:15){
                        Text("Cash Payment")
                            .padding(.trailing, 16)
                       
                        Text("default method")
                            .foregroundColor(.gray)
                            .padding(.bottom, 16)
                    }
                   

                }.padding()
                
                
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.gray.opacity(0.15))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 130)
                    .frame(maxWidth: .infinity) // Make the field wider
                
               
                VStack{
                    HStack{
                        Text("Basket Total")
                            .foregroundColor(.gray)
                           Spacer()
                        Text("+ TND 32.00")
                            .foregroundColor(.gray)
                         
                    }
                        Divider()
                            
                    HStack{
                        Text("Discount ")
                            .foregroundColor(.gray)
                           Spacer()
                        Text("- TND 32.00")
                            .foregroundColor(.blue)
                        
                    }
                    
                    Divider()
                    HStack{
                        Text(" Total")
                            .foregroundColor(.gray)
                           Spacer()
                        Text(" TND 32.00")
                            .foregroundColor(.gray)
                        
                    }
                    
                
                    
                }.padding()

                
               
              
                
            }
            
            Section {
                NavigationLink(destination: secondPaymentView()) {
                    Text("Book now")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }}
        }.padding(20).navigationTitle("Payment method")
       
       
           
        
    }
    
}
        
struct addCardview: View {
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""

    var body: some View {
        Image("mastercard1")
            .font(.system(size: 24))

        VStack(alignment: .leading, spacing: 15) {
           
            Form {
                Section {
                    TextField("Full Name", text: $fullName)
                    TextField("Card Number", text: $cardNumber)
                    HStack(alignment: .center){
                       
                        TextField("Cvv", text: $cvv)
                        DatePicker("Date", selection: $date, displayedComponents: .date).padding(2)
                      
                     
                    }
                 
                                  
                                  }
                Text("Add New Card")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            
            
            
        }
    }
}


struct secondPaymentView: View {
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""
    @State private var showAlert = false
    @State private var showChatView = false
    
    var body: some View {
        
        VStack(alignment : .leading,spacing:20){
            
            HStack{
                Text("Payment Methods")
                    .font(.system(size: 16, weight: .semibold))
                
                
                
                Spacer()
                
                Button("Add New Card") {
                    // Action to show the map
                }
                .foregroundColor(Color.pink)
                
                
            }.padding()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.blue.opacity(0.1))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 400)
                    .frame(maxWidth: .infinity) // Make the field wider
                VStack(alignment: .leading,spacing:30){
                    HStack {
                        
                        Image("paypal")
                            .padding(.leading, 16)
                        Text("Paypal")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    
                    
                    HStack {
                        
                        Image("paypal")
                            .padding(.leading, 16)
                        Text("Paypal")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    HStack {
                        
                        Image("paypal")
                            .padding(.leading, 16)
                        Text("Paypal")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    
                    Text("Pay with Debit/Credit Card")
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Image("mastercard")
                            .padding(.leading, 16)
                        Text("master card")
                        
                        
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            
                            Circle()
                                .stroke(Color.blue , lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                            
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width  - 50 ,height:60)
                    
                    
                        .background(Color.white).cornerRadius(20)
                    
                }
            }.padding()
            
            VStack {
                NavigationLink(
                    destination: ContentChatView(),
                    isActive: $showChatView,
                    label: {
                        EmptyView()
                    }
                )}
            
            Button(action: {
                // Handle payment logic here
                showAlert = true
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Payment Successful"),
                    message: Text("Your payment has been processed."),
                    dismissButton: .default(Text("OK"), action: {
                        // After the alert is dismissed, set the flag to show the ChatView
                        showChatView = true
                    })
                )
            }
            
            
            
        }
    }
    
    
    
    
    
    
    
    enum PaymentMethod: String, Equatable, CaseIterable {
        case creditCard = "Credit Card"
        case cash = "Cash"
        case amen = "Amen"
    }
}
