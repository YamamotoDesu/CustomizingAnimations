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


