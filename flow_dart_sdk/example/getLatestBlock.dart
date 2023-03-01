import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/constants.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/fcl.dart';

void main() async {
  final FlowClient flow = FlowClient(LOCALHOST, EMULATOR_PORT);

  final latestBlock = await flow.getBlock();
  print(latestBlock);

  print("✅ Done");
}
