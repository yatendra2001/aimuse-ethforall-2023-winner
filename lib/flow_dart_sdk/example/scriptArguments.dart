import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/fcl.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/constants.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/types.dart';

void main() async {
  final flow = FlowClient(LOCALHOST, EMULATOR_PORT);

  final code = '''
    pub fun main(message: String): Int {
      log(message)
      return 42
    }
  ''';

  final arguments = [
    CadenceValue(value: "Hello from Dart Flow Client", type: CadenceType.String)
  ];

  final response = await flow.executeScript(code, arguments: arguments);
  final Map<String, dynamic> decodedResult = flow.decodeResponse(response);
  final cadenceValue = CadenceValue.fromJson(decodedResult);

  print(cadenceValue.value);
  print(cadenceValue.type);

  print("✅ Done");
}
