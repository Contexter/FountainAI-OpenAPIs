// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "FountainAI-OpenAPIs",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "FountainAI-OpenAPIs", targets: ["FountainAI-OpenAPIs"]),
    ],
    targets: [
        .target(
            name: "FountainAI-OpenAPIs",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "FountainAI-OpenAPIsTests",
            dependencies: ["FountainAI-OpenAPIs"]
        )
    ]
)
