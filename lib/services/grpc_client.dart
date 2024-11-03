import 'package:grpc/grpc.dart';

class GRPCClient {
  late ClientChannel channel;

  GRPCClient() {
    channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }
}
