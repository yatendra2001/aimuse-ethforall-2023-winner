import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/fcl.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/constants.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/format.dart';

void main() async {
  final FlowClient flow = FlowClient(LOCALHOST, EMULATOR_PORT);
  final account = (await flow.getAccount(SERVICE_ACCOUNT)).account;

  final formatted = formatUFix64(account.balance);
  final accountBalance = await flow.getAccountBalance(SERVICE_ACCOUNT);

  print("From Account: $formatted");
  print("Direct: $accountBalance");

  print("✅ Done");
}
