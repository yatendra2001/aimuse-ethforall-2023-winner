import 'dart:convert';

import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/constants.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/fcl.dart';

void main() async {
  final flow = FlowClient(LOCALHOST, EMULATOR_PORT);

  final code = '''
    transaction{
      prepare(signer: AuthAccount){
        log("Done!");
      }
    }
  ''';

  final response = await flow.sendTransaction(code);
  print(response);

  print("✅ Done");
}
