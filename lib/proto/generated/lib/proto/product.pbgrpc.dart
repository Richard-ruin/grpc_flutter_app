//
//  Generated code. Do not modify.
//  source: lib/proto/product.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'product.pb.dart' as $0;

export 'product.pb.dart';

@$pb.GrpcServiceName('ProductService')
class ProductServiceClient extends $grpc.Client {
  static final _$createProduct = $grpc.ClientMethod<$0.Product, $0.Product>(
      '/ProductService/CreateProduct',
      ($0.Product value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Product.fromBuffer(value));
  static final _$getProduct = $grpc.ClientMethod<$0.ProductRequest, $0.Product>(
      '/ProductService/GetProduct',
      ($0.ProductRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Product.fromBuffer(value));
  static final _$updateProduct = $grpc.ClientMethod<$0.Product, $0.Product>(
      '/ProductService/UpdateProduct',
      ($0.Product value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Product.fromBuffer(value));
  static final _$deleteProduct = $grpc.ClientMethod<$0.ProductRequest, $0.ProductResponse>(
      '/ProductService/DeleteProduct',
      ($0.ProductRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProductResponse.fromBuffer(value));
  static final _$listProducts = $grpc.ClientMethod<$0.Empty, $0.ProductList>(
      '/ProductService/ListProducts',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProductList.fromBuffer(value));

  ProductServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Product> createProduct($0.Product request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.Product> getProduct($0.ProductRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.Product> updateProduct($0.Product request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProductResponse> deleteProduct($0.ProductRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProductList> listProducts($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listProducts, request, options: options);
  }
}

@$pb.GrpcServiceName('ProductService')
abstract class ProductServiceBase extends $grpc.Service {
  $core.String get $name => 'ProductService';

  ProductServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Product, $0.Product>(
        'CreateProduct',
        createProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Product.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProductRequest, $0.Product>(
        'GetProduct',
        getProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProductRequest.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Product, $0.Product>(
        'UpdateProduct',
        updateProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Product.fromBuffer(value),
        ($0.Product value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProductRequest, $0.ProductResponse>(
        'DeleteProduct',
        deleteProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProductRequest.fromBuffer(value),
        ($0.ProductResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ProductList>(
        'ListProducts',
        listProducts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ProductList value) => value.writeToBuffer()));
  }

  $async.Future<$0.Product> createProduct_Pre($grpc.ServiceCall call, $async.Future<$0.Product> request) async {
    return createProduct(call, await request);
  }

  $async.Future<$0.Product> getProduct_Pre($grpc.ServiceCall call, $async.Future<$0.ProductRequest> request) async {
    return getProduct(call, await request);
  }

  $async.Future<$0.Product> updateProduct_Pre($grpc.ServiceCall call, $async.Future<$0.Product> request) async {
    return updateProduct(call, await request);
  }

  $async.Future<$0.ProductResponse> deleteProduct_Pre($grpc.ServiceCall call, $async.Future<$0.ProductRequest> request) async {
    return deleteProduct(call, await request);
  }

  $async.Future<$0.ProductList> listProducts_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listProducts(call, await request);
  }

  $async.Future<$0.Product> createProduct($grpc.ServiceCall call, $0.Product request);
  $async.Future<$0.Product> getProduct($grpc.ServiceCall call, $0.ProductRequest request);
  $async.Future<$0.Product> updateProduct($grpc.ServiceCall call, $0.Product request);
  $async.Future<$0.ProductResponse> deleteProduct($grpc.ServiceCall call, $0.ProductRequest request);
  $async.Future<$0.ProductList> listProducts($grpc.ServiceCall call, $0.Empty request);
}
