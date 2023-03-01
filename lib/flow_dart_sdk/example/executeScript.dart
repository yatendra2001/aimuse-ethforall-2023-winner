import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/fcl.dart';

void main() async {
  final endpoint = "localhost";
  final port = FlowClient.FLOW_EMULATOR_PORT;
  final FlowClient flow = FlowClient(endpoint, port);

  final code = '''
    pub fun main(): Int {
      log("Hello from FlowClient");
      return 42
    }
  ''';

  final result = await flow.executeScript(code);
  final decoded = flow.decodeResponse(result);

  print(result);
  print(decoded);

  print("✅ Done");
}
