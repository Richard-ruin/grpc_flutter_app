import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_flutter_app/services/product_service.dart';
import 'package:grpc_flutter_app/proto/generated/lib/proto/product.pb.dart';

void main() {
  runApp(MyApp());
}

class _ProductDialog extends StatelessWidget {
  final Function(String, double, String) onSubmit;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _ProductDialog({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Product"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _priceController,
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            final name = _nameController.text;
            final price = double.tryParse(_priceController.text) ?? 0;
            final description = _descriptionController.text;
            onSubmit(name, price, description);
            Navigator.pop(context);
          },
          child: Text("Add"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ClientChannel _channel = ClientChannel(
    'localhost', // Replace with your server's IP if needed
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  late ProductService _productService;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _productService = ProductService(_channel);
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final response = await _productService.listProducts();
      setState(() {
        _products = response.products;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void _addProduct() {
    showDialog(
      context: context,
      builder: (context) => _ProductDialog(
        onSubmit: (name, price, description) async {
          final product =
              Product(name: name, price: price, description: description);
          await _productService.createProduct(product);
          _fetchProducts();
        },
      ),
    );
  }

  void _deleteProduct(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Product"),
        content: Text("Are you sure you want to delete this product?"),
        actions: [
          TextButton(
            onPressed: () async {
              await _productService.deleteProduct(id);
              _fetchProducts();
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("No"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channel.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product CRUD'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} - ${product.description}'),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteProduct(product.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: Icon(Icons.add),
      ),
    );
  }
}
