import SwiftUI

struct Driver: View {
    @State private var currentPage: CGFloat = 1.0 / 3.0
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Driver")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 300)
                        .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                    
                  
                    NavigationLink(destination: TrackYourRide()) {
                        Text("Confirm Your Driver")
                            .font(.system(size: 30, weight: .medium, design: .default))
                        .frame(width: 200, height: 200)}
                    
                    Text("Huge drivers network helps you find comfortable,safe and cheap rode ")
                        .font(.system(size: 22, weight: .medium, design: .default))
                    
                    
                }
                LinearProgressBar(progress: currentPage)
                    .frame(height: 10)
                    .edgesIgnoringSafeArea(.bottom)
            }
            .onAppear {
                // Set progressBarAnimation to true when the view appears to animate the progress bar
                withAnimation(Animation.linear(duration: 0.5)) {
                    currentPage = 2.0 / 3.0
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}


    
    
    
    struct Driver_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
