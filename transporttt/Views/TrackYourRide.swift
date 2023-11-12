import SwiftUI

struct TrackYourRide: View {
    @State private var currentPage: CGFloat = 3.0 / 3.0
    @State private var navigateToLocation = false
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image("Driver")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                
                
                Text("Track your ride")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .frame(width: 200, height: 100)
                
                Text("Huge drivers network helps you find comfortable,safe and cheap rode ")
                    .font(.system(size: 22, weight: .medium, design: .default))
                
                
                
                VStack {
                    NavigationLink(destination: Location(), isActive: $navigateToLocation) {
                    
                    }

                        .hidden()
                   
                    Button(action: {
                        navigateToLocation = true
                        
                    })
                    {
                        Text("  GET STARTED!    ")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .frame(width: 300, height: 150)
                    }.padding(.bottom, 60)
                    
                    
                }
                
                
            }.navigationBarBackButtonHidden(true)
            
            LinearProgressBar(progress: currentPage)
                .frame(height: 10)
                .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            // Set progressBarAnimation to true when the view appears to animate the progress bar
            withAnimation(Animation.linear(duration: 0.5)) {
                currentPage = 3.0 / 3.0
            }
        }
    }
    
    
    
    
    struct LinearProgressBar: View {
        var progress: CGFloat
        
        var body: some View {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: geometry.size.width * self.progress, height: geometry.size.height)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width * (1 - self.progress), height: geometry.size.height)
                        .cornerRadius(10)
                    .frame(height: 700)            }
            }
            .frame(width: 200  , alignment: .leading)
        }
    }
    
    
    
    struct TrackYourRide_Previews: PreviewProvider {
        static var previews: some View {
            Driver()
        }
    }
    
}
