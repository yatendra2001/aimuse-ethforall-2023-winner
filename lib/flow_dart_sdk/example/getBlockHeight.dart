import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/fcl.dart';

void main() async {
  final port = FlowClient.FLOW_EMULATOR_PORT;
  final flow = FlowClient("localhost", port);

  final height = await flow.getBlockHeight();
  print(height);

  print("✅ Done");
}
