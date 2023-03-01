import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/types.dart';

dynamic prepareArguments(List<CadenceValue> arguments) {
  var args = List<CadenceValue>.empty();

  if (arguments != null) {
    args = arguments;
  }
  return args.map((e) => e.toMessage());
}
