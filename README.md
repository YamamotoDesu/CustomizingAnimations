# CustomizingAnimations

<img width="300" alt="スクリーンショット 2023-02-18 14 56 33" src="https://user-images.githubusercontent.com/47273077/219843916-3bf0e476-4470-40a9-8a59-249cb6ddd8a5.gif">

```swift
        Button("Tap Me")
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
```

<img width="300" alt="スクリーンショット 2023-02-18 14 56 33" src="https://user-images.githubusercontent.com/47273077/219844671-3d735486-6255-4116-a410-7dc3f133ab84.gif">

```swift
 var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: false)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
 ```
 
 
<img width="300" alt="スクリーンショット 2023-02-18 14 56 33" src="https://user-images.githubusercontent.com/47273077/219845329-5bb4a6b2-5e7f-4cba-888c-1548354c4216.gif">

```swift
 @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
 ```
 
<img width="300" alt="スクリーンショット 2023-02-18 14 56 33" src="https://user-images.githubusercontent.com/47273077/219846332-be61def3-e142-4f96-911d-9d088b0607ee.gif">

```swift
 @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
 ```

<img width="300" alt="スクリーンショット 2023-02-18 14 56 33" src="https://user-images.githubusercontent.com/47273077/219847462-50ee1cbb-b418-47b2-9f60-e4e25e5923da.gif">

```swift
struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                    }
            )
            .animation(.spring(), value: dragAmount)
    }
}
```

<img width="300" alt="スクリーンショット 2023-02-18 14 56 33" src="https://user-images.githubusercontent.com/47273077/219848244-80ff9552-f93b-4a32-837b-6e6a7a305f6d.gif">

```swift

 @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? Color.blue : Color.red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }

```
