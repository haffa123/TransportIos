import SwiftUI

struct ContentView: View {
    @State private var currentPage: CGFloat = 1.0 / 3.0
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("taxi")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                    
                    NavigationLink(destination: Driver()) {
                        Text("Request Ride")
                            .font(.system(size: 32, weight: .medium, design: .default))
                        .frame(width: 200, height: 100)}
                    
                    Text("Request a ride, get picked up by a nearby community driver")
                        .font(.system(size: 22, weight: .medium, design: .default))
                    
                    
                }
                
                LinearProgressBar(progress: currentPage)
                    .frame(height: 10)
                    .edgesIgnoringSafeArea(.bottom)
            }
            .onAppear {
                // Set progressBarAnimation to true when the view appears to animate the progress bar
                withAnimation(Animation.linear(duration: 0.5)) {
                    currentPage = 1.0 / 3.0
                }
            }
        }.navigationBarBackButtonHidden(true)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
