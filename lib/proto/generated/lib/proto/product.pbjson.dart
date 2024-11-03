//
//  Generated code. Do not modify.
//  source: lib/proto/product.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use productDescriptor instead')
const Product$json = {
  '1': 'Product',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price', '3': 3, '4': 1, '5': 1, '10': 'price'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Product`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productDescriptor = $convert.base64Decode(
    'CgdQcm9kdWN0Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBXByaWNlGA'
    'MgASgBUgVwcmljZRIgCgtkZXNjcmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24=');

@$core.Deprecated('Use productRequestDescriptor instead')
const ProductRequest$json = {
  '1': 'ProductRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `ProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productRequestDescriptor = $convert.base64Decode(
    'Cg5Qcm9kdWN0UmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');

@$core.Deprecated('Use productResponseDescriptor instead')
const ProductResponse$json = {
  '1': 'ProductResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productResponseDescriptor = $convert.base64Decode(
    'Cg9Qcm9kdWN0UmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use productListDescriptor instead')
const ProductList$json = {
  '1': 'ProductList',
  '2': [
    {'1': 'products', '3': 1, '4': 3, '5': 11, '6': '.Product', '10': 'products'},
  ],
};

/// Descriptor for `ProductList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productListDescriptor = $convert.base64Decode(
    'CgtQcm9kdWN0TGlzdBIkCghwcm9kdWN0cxgBIAMoCzIILlByb2R1Y3RSCHByb2R1Y3Rz');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

