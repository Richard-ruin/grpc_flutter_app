import 'package:grpc/grpc.dart';
import 'package:grpc_flutter_app/proto/generated/lib/proto/product.pb.dart';
import 'package:grpc_flutter_app/proto/generated/lib/proto/product.pbgrpc.dart';

class ProductService {
  final ProductServiceClient _client;

  ProductService(ClientChannel channel)
      : _client = ProductServiceClient(channel);

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
