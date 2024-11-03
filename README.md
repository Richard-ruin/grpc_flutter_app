Here’s the complete `README.md` content formatted as a single Markdown document for the Flutter gRPC CRUD Product App:

```markdown
# Flutter gRPC CRUD Product App

This application is a gRPC-based CRUD implementation using Flutter as the client and a gRPC server defined via a `.proto` file. The app features a single product screen with add and delete functionality via a pop-up dialog.

## Features

- **Add Product**: Adds a new product by filling out the name, price, and description fields.
- **Delete Product**: Deletes a selected product through a confirmation pop-up.
- **Product List**: Displays the list of products from the gRPC server.

## Prerequisites

1. **Flutter SDK**: Ensure that the Flutter SDK is installed.
2. **gRPC Plugin for Flutter**: Add the `grpc` dependency to the Flutter project.
3. **Protobuf Compiler (`protoc`)**: Used to generate `.pb.dart` files from the `.proto` file.
4. **gRPC Server**: A running gRPC server that handles CRUD operations for products.

## Project Structure
```

grpc-flutter-product/
├── lib/
│   ├── main.dart                 # Entry point for the Flutter application
│   ├── product_service.dart      # Service to call gRPC CRUD operations
│   ├── screens/
│   │   └── product_screen.dart   # Main screen with product list and pop-up dialogs
│   └── generated/               # gRPC files generated from product.proto
└── proto/
    └── product.proto            # gRPC definitions for product service and messages

````

## Setup Steps

### 1. Define gRPC Service in `product.proto`

Create the `product.proto` file to define the service and message structure for products:

```proto
syntax = "proto3";

service ProductService {
  rpc CreateProduct(Product) returns (Product);
  rpc GetProduct(ProductRequest) returns (Product);
  rpc UpdateProduct(Product) returns (Product);
  rpc DeleteProduct(ProductRequest) returns (ProductResponse);
  rpc ListProducts(Empty) returns (ProductList);
}

message Product {
  int32 id = 1;
  string name = 2;
  double price = 3;
  string description = 4;
}

message ProductRequest {
  int32 id = 1;
}

message ProductResponse {
  string message = 1;
}

message ProductList {
  repeated Product products = 1;
}

message Empty {}
````

### 2. Generate gRPC Code for Flutter

Use `protoc` to generate Dart code from the `.proto` file:

```bash
protoc --dart_out=grpc:lib/generated -Iproto proto/product.proto
```

This command will generate `.pb.dart` and `.pbgrpc.dart` files in the `lib/generated` directory.

### 3. Set Up gRPC Server

Make sure you have a gRPC server that matches the CRUD definitions in `product.proto`. The server can be implemented in any language, such as Go or Python. A basic example in Go is available in the [Go gRPC Documentation](https://grpc.io/docs/languages/go/).

### 4. Implement `product_service.dart`

This file manages the gRPC connections and CRUD requests from the Flutter client to the server.

```dart
import 'package:grpc/grpc.dart';
import 'generated/product.pb.dart';
import 'generated/product.pbgrpc.dart';

class ProductService {
  final ProductServiceClient _client;

  ProductService(ClientChannel channel) : _client = ProductServiceClient(channel);

  Future<Product> createProduct(Product product) async {
    return await _client.createProduct(product);
  }

  Future<Product> getProduct(int id) async {
    return await _client.getProduct(ProductRequest(id: id));
  }

  Future<Product> updateProduct(Product product) async {
    return await _client.updateProduct(product);
  }

  Future<ProductResponse> deleteProduct(int id) async {
    return await _client.deleteProduct(ProductRequest(id: id));
  }

  Future<ProductList> listProducts() async {
    return await _client.listProducts(Empty());
  }
}
```

### 5. Build the UI in `main.dart` and `product_screen.dart`

The main screen displays the product list with add and delete options.

#### main.dart

```dart
import 'package:flutter/material.dart';
import 'product_service.dart';
import 'screens/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product CRUD',
      home: ProductScreen(),
    );
  }
}
```

#### product_screen.dart

This screen contains the main UI with the product list and dialogs for adding and deleting products.

```dart
// Code implementation for product list and dialogs
// See the detailed code example above for the full implementation.
```

### 6. Configure Emulator to Access Host Server

When running the app on an Android emulator, use `10.0.2.2` instead of `localhost` to access the server running on the host computer. Ensure the address and port match those of the gRPC server.

```dart
final ClientChannel _channel = ClientChannel(
  '10.0.2.2', // Change to the host's IP address if needed
  port: 50051, // The gRPC server port
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);
```

### 7. Run the Application

- Start the gRPC server on the host machine.
- Launch the emulator and run the Flutter app:

```bash
flutter run
```

If the server is running and the IP and port configurations are correct, the application will connect to the server, and you can use the CRUD features from the main screen.

## Troubleshooting

- **gRPC Error 14 (UNAVAILABLE)**: Verify the server is running and the address/port are correctly configured.
- **Emulator Connection to `localhost` Fails**: Use `10.0.2.2` on Android emulator to access the host’s `localhost`.

---

By following these steps, you’ll have a fully functional Flutter gRPC CRUD application that allows adding, viewing, updating, and deleting products through gRPC.

```

You can copy and paste this content directly into a `README.md` file in your project.
```
