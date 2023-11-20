//
//  PaimentView.swift
//  transporttt
//
//  Created by haffa dhifi on 16/11/2023.
//
import SwiftUI


struct PaimentView: View {
        @State private var selectedDate: Date = Date()
       // @State private var user = User()
        @State private var selectedHours: String = ""
        @State private var selectedPhoneNumber: String = ""
        @State private var isForAnotherPerson = false
        @State private var totalPrice: Double = 1000
        //@State private var paymentMethodParams : STPPaymentMethodParams?
        //@StateObject var guideViewModel: GuideViewModel
       // @Binding var guide: Guide
        @State private var isActive = false
        @Binding var discountCode: Double
       /* private func calculateTotalPrice() -> Double {
            if let hours = Int(selectedHours) {
                //let pricePerHour = guide.price // Adjust as needed
                let totalPrice = hours * pricePerHour
                return Double((totalPrice))
            } else {
                return 0 // Handle invalid input
            }
        }
        
        func formatTotalPrice() -> String {
                return String(format: "$%.2f", calculateTotalPrice())
            }*/
        

            
        var body: some View {
             
                   Form {
                       Section {
                           DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                       }

                       Section(header: Text("Select Hours")) {
                           TextField("Number of Hours", text: $selectedHours)
                               .keyboardType(.numberPad)
                       }

                       Section(header: Text("Total Price")) {
                           Text("price")
                               .foregroundColor(.blue)
                       }
                       
                       /*Section {
                           STPPaymentCardTextField.Representable.init(paymentMethodParams : $paymentMethodParams)
                       }*/

                       Section(header: Text("Is this booking for you?")) {
                           Toggle("For Me", isOn: $isForAnotherPerson)
                       }

            
                           
                       }
                   }
                
               }
           

           private func ContinueButton(_ title: String, action: @escaping () -> Void) -> some View {
               Button(action: action) {
                   Text(title)
                       .frame(maxWidth: .infinity)
                       .frame(height: 44)
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(8)
               }
           }

           
       

