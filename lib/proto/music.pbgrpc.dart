//
//  Generated code. Do not modify.
//  source: music.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'music.pb.dart' as $0;

export 'music.pb.dart';

@$pb.GrpcServiceName('music.MusicService')
class MusicServiceClient extends $grpc.Client {
  static final _$streamMusic = $grpc.ClientMethod<$0.StreamRequest, $0.AudioChunk>(
      '/music.MusicService/StreamMusic',
      ($0.StreamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AudioChunk.fromBuffer(value));
  static final _$searchMusic = $grpc.ClientMethod<$0.SearchRequest, $0.SearchResponse>(
      '/music.MusicService/SearchMusic',
      ($0.SearchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchResponse.fromBuffer(value));
  static final _$uploadMusic = $grpc.ClientMethod<$0.UploadRequest, $0.UploadResponse>(
      '/music.MusicService/UploadMusic',
      ($0.UploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadResponse.fromBuffer(value));

  MusicServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.AudioChunk> streamMusic($0.StreamRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamMusic, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.SearchResponse> searchMusic($0.SearchRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchMusic, request, options: options);
  }

  $grpc.ResponseFuture<$0.UploadResponse> uploadMusic($async.Stream<$0.UploadRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadMusic, request, options: options).single;
  }
}

@$pb.GrpcServiceName('music.MusicService')
abstract class MusicServiceBase extends $grpc.Service {
  $core.String get $name => 'music.MusicService';

  MusicServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StreamRequest, $0.AudioChunk>(
        'StreamMusic',
        streamMusic_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StreamRequest.fromBuffer(value),
        ($0.AudioChunk value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchRequest, $0.SearchResponse>(
        'SearchMusic',
        searchMusic_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchRequest.fromBuffer(value),
        ($0.SearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadRequest, $0.UploadResponse>(
        'UploadMusic',
        uploadMusic,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadRequest.fromBuffer(value),
        ($0.UploadResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.AudioChunk> streamMusic_Pre($grpc.ServiceCall call, $async.Future<$0.StreamRequest> request) async* {
    yield* streamMusic(call, await request);
  }

  $async.Future<$0.SearchResponse> searchMusic_Pre($grpc.ServiceCall call, $async.Future<$0.SearchRequest> request) async {
    return searchMusic(call, await request);
  }

  $async.Stream<$0.AudioChunk> streamMusic($grpc.ServiceCall call, $0.StreamRequest request);
  $async.Future<$0.SearchResponse> searchMusic($grpc.ServiceCall call, $0.SearchRequest request);
  $async.Future<$0.UploadResponse> uploadMusic($grpc.ServiceCall call, $async.Stream<$0.UploadRequest> request);
}
