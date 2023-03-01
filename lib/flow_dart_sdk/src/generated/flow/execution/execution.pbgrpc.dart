///
//  Generated code. Do not modify.
//  source: flow/execution/execution.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'execution.pb.dart' as $1;
export 'execution.pb.dart';

class ExecutionAPIClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$1.PingRequest, $1.PingResponse>(
      '/flow.execution.ExecutionAPI/Ping',
      ($1.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PingResponse.fromBuffer(value));
  static final _$getAccountAtBlockID = $grpc.ClientMethod<
          $1.GetAccountAtBlockIDRequest, $1.GetAccountAtBlockIDResponse>(
      '/flow.execution.ExecutionAPI/GetAccountAtBlockID',
      ($1.GetAccountAtBlockIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetAccountAtBlockIDResponse.fromBuffer(value));
  static final _$executeScriptAtBlockID = $grpc.ClientMethod<
          $1.ExecuteScriptAtBlockIDRequest, $1.ExecuteScriptAtBlockIDResponse>(
      '/flow.execution.ExecutionAPI/ExecuteScriptAtBlockID',
      ($1.ExecuteScriptAtBlockIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.ExecuteScriptAtBlockIDResponse.fromBuffer(value));
  static final _$getEventsForBlockIDs = $grpc.ClientMethod<
          $1.GetEventsForBlockIDsRequest, $1.GetEventsForBlockIDsResponse>(
      '/flow.execution.ExecutionAPI/GetEventsForBlockIDs',
      ($1.GetEventsForBlockIDsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetEventsForBlockIDsResponse.fromBuffer(value));
  static final _$getTransactionResult = $grpc.ClientMethod<
          $1.GetTransactionResultRequest, $1.GetTransactionResultResponse>(
      '/flow.execution.ExecutionAPI/GetTransactionResult',
      ($1.GetTransactionResultRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetTransactionResultResponse.fromBuffer(value));

  ExecutionAPIClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.PingResponse> ping($1.PingRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$ping, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.GetAccountAtBlockIDResponse> getAccountAtBlockID(
      $1.GetAccountAtBlockIDRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccountAtBlockID, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.ExecuteScriptAtBlockIDResponse>
      executeScriptAtBlockID($1.ExecuteScriptAtBlockIDRequest request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$executeScriptAtBlockID, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.GetEventsForBlockIDsResponse> getEventsForBlockIDs(
      $1.GetEventsForBlockIDsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getEventsForBlockIDs, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.GetTransactionResultResponse> getTransactionResult(
      $1.GetTransactionResultRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionResult, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ExecutionAPIServiceBase extends $grpc.Service {
  $core.String get $name => 'flow.execution.ExecutionAPI';

  ExecutionAPIServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.PingRequest, $1.PingResponse>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PingRequest.fromBuffer(value),
        ($1.PingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetAccountAtBlockIDRequest,
            $1.GetAccountAtBlockIDResponse>(
        'GetAccountAtBlockID',
        getAccountAtBlockID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetAccountAtBlockIDRequest.fromBuffer(value),
        ($1.GetAccountAtBlockIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ExecuteScriptAtBlockIDRequest,
            $1.ExecuteScriptAtBlockIDResponse>(
        'ExecuteScriptAtBlockID',
        executeScriptAtBlockID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ExecuteScriptAtBlockIDRequest.fromBuffer(value),
        ($1.ExecuteScriptAtBlockIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetEventsForBlockIDsRequest,
            $1.GetEventsForBlockIDsResponse>(
        'GetEventsForBlockIDs',
        getEventsForBlockIDs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetEventsForBlockIDsRequest.fromBuffer(value),
        ($1.GetEventsForBlockIDsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetTransactionResultRequest,
            $1.GetTransactionResultResponse>(
        'GetTransactionResult',
        getTransactionResult_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetTransactionResultRequest.fromBuffer(value),
        ($1.GetTransactionResultResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.PingResponse> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$1.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$1.GetAccountAtBlockIDResponse> getAccountAtBlockID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetAccountAtBlockIDRequest> request) async {
    return getAccountAtBlockID(call, await request);
  }

  $async.Future<$1.ExecuteScriptAtBlockIDResponse> executeScriptAtBlockID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ExecuteScriptAtBlockIDRequest> request) async {
    return executeScriptAtBlockID(call, await request);
  }

  $async.Future<$1.GetEventsForBlockIDsResponse> getEventsForBlockIDs_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetEventsForBlockIDsRequest> request) async {
    return getEventsForBlockIDs(call, await request);
  }

  $async.Future<$1.GetTransactionResultResponse> getTransactionResult_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetTransactionResultRequest> request) async {
    return getTransactionResult(call, await request);
  }

  $async.Future<$1.PingResponse> ping(
      $grpc.ServiceCall call, $1.PingRequest request);
  $async.Future<$1.GetAccountAtBlockIDResponse> getAccountAtBlockID(
      $grpc.ServiceCall call, $1.GetAccountAtBlockIDRequest request);
  $async.Future<$1.ExecuteScriptAtBlockIDResponse> executeScriptAtBlockID(
      $grpc.ServiceCall call, $1.ExecuteScriptAtBlockIDRequest request);
  $async.Future<$1.GetEventsForBlockIDsResponse> getEventsForBlockIDs(
      $grpc.ServiceCall call, $1.GetEventsForBlockIDsRequest request);
  $async.Future<$1.GetTransactionResultResponse> getTransactionResult(
      $grpc.ServiceCall call, $1.GetTransactionResultRequest request);
}
