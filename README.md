# FountainAI-OpenAPIs

FountainAI-OpenAPIs is a foundational Swift library providing OpenAPI specifications for the modular microservices ecosystem that drives **FountainAI**. This repository acts as the core mechanism for API versioning and resource management, enabling developers to seamlessly integrate FountainAI microservices into their projects.

---

## **Overview**

The FountainAI-OpenAPIs library is designed to:
1. **Centralize API Versioning:** Ensures consistent and maintainable access to the latest OpenAPI specifications for all FountainAI microservices.
2. **Provide Modular API Access:** Supports individual services like `Character-Service`, `Story-Factory-Service`, and `Session-And-Context-Service`, with their respective OpenAPI definitions available in a unified framework.
3. **Enable Resource Discovery:** Swift's resource management APIs (e.g., `Bundle.module`) provide seamless access to OpenAPI files at runtime for dynamic interaction and tooling.
4. **Support Scalable Development:** Integrates directly with client/server code generators, enabling developers to scaffold solutions around FountainAI microservices.

---

## **Table of Contents**
- [Getting Started](#getting-started)
- [Library Architecture](#library-architecture)
- [Core Features](#core-features)
- [Using OpenAPI Resources](#using-openapi-resources)
- [Contributing](#contributing)
- [License](#license)

---

## **Getting Started**

### **Installation**

Add the library to your project using Swift Package Manager (SPM):

```swift
dependencies: [
    .package(url: "https://github.com/Contexter/FountainAI-OpenAPIs.git", from: "1.1.0")
]
```

Integrate the library into your target:

```swift
.target(
    name: "MyTarget",
    dependencies: [
        "FountainAI-OpenAPIs"
    ]
)
```

---

## **Library Architecture**

The library is organized into three primary components:

1. **OpenAPI Resource Management:**
   - Each microservice (e.g., `Action-Service`, `Character-Service`) has a corresponding OpenAPI YAML file in the `Resources` directory.
   - These resources are bundled and made accessible via `Bundle.module`.

2. **Versioning and Updates:**
   - Each release is versioned, ensuring developers can lock their applications to specific API versions.
   - OpenAPI updates follow semantic versioning for clarity and predictability.

3. **Swift Library Integration:**
   - The Swift library format ensures compatibility with tools like Xcode and SPM.
   - It supports modular imports and direct resource loading, allowing seamless integration into any Swift-based project.

---

## **Core Features**

### **1. Unified API Resource Management**
The library bundles OpenAPI definitions for all FountainAI microservices in a single Swift package. This allows applications to:
- Dynamically load and parse API specifications.
- Generate client/server code using tools like [OpenAPI Generator](https://openapi-generator.tech/).

### **2. API Version Control**
Each release of FountainAI-OpenAPIs corresponds to a specific set of API versions:
- Enables locking to a stable API version (`from: "1.1.0"`).
- Ensures forward compatibility with new microservice features.

### **3. Seamless Integration**
Built for Swift:
- Use `Bundle.module` to access OpenAPI files at runtime.
- Generate and validate API requests/responses directly within Swift.

---

## **Using OpenAPI Resources**

### **Accessing OpenAPI Files**
The OpenAPI files are bundled as resources and can be accessed via `Bundle.module`:

```swift
import Foundation
import FountainAI_OpenAPIs

func loadOpenAPI(for serviceName: String) -> String? {
    guard let url = Bundle.module.url(forResource: serviceName, withExtension: "yml") else {
        print("Error: \(serviceName) OpenAPI file not found.")
        return nil
    }

    do {
        return try String(contentsOf: url, encoding: .utf8)
    } catch {
        print("Failed to load \(serviceName): \(error)")
        return nil
    }
}

// Example Usage
if let actionServiceSpec = loadOpenAPI(for: "Action-Service") {
    print(actionServiceSpec)
}
```

### **Example OpenAPI Workflow**
1. Load the desired OpenAPI file using `Bundle.module`.
2. Use the loaded YAML content with tools like `Yams` for parsing:
   ```swift
   import Yams

   if let yamlString = loadOpenAPI(for: "Character-Service") {
       let parsed = try Yams.load(yaml: yamlString)
       print("Parsed YAML: \(parsed)")
   }
   ```
3. Generate client/server code or validate interactions with the corresponding APIs.

---

## **Contributing**

We welcome contributions to FountainAI-OpenAPIs:
1. Fork the repository.
2. Add or update OpenAPI files in `Sources/FountainAI-OpenAPIs/Resources`.
3. Submit a pull request with a detailed description.

---

## **License**

This library is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute it under the terms of the license.

---

## **Summary**

The FountainAI-OpenAPIs library is the backbone of API versioning for FountainAI microservices, enabling dynamic resource discovery and scalable development. Its integration as a Swift package ensures consistency, ease of use, and compatibility with modern development workflows. Let us know if you encounter any issues or have suggestions for improvement!

