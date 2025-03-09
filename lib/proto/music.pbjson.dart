//
//  Generated code. Do not modify.
//  source: music.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use streamRequestDescriptor instead')
const StreamRequest$json = {
  '1': 'StreamRequest',
  '2': [
    {'1': 'music_id', '3': 1, '4': 1, '5': 9, '10': 'musicId'},
    {'1': 'start_position', '3': 2, '4': 1, '5': 5, '10': 'startPosition'},
  ],
};

/// Descriptor for `StreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamRequestDescriptor = $convert.base64Decode(
    'Cg1TdHJlYW1SZXF1ZXN0EhkKCG11c2ljX2lkGAEgASgJUgdtdXNpY0lkEiUKDnN0YXJ0X3Bvc2'
    'l0aW9uGAIgASgFUg1zdGFydFBvc2l0aW9u');

@$core.Deprecated('Use audioChunkDescriptor instead')
const AudioChunk$json = {
  '1': 'AudioChunk',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'sequence_number', '3': 2, '4': 1, '5': 5, '10': 'sequenceNumber'},
  ],
};

/// Descriptor for `AudioChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioChunkDescriptor = $convert.base64Decode(
    'CgpBdWRpb0NodW5rEhIKBGRhdGEYASABKAxSBGRhdGESJwoPc2VxdWVuY2VfbnVtYmVyGAIgAS'
    'gFUg5zZXF1ZW5jZU51bWJlcg==');

@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = {
  '1': 'SearchRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode(
    'Cg1TZWFyY2hSZXF1ZXN0EhQKBXF1ZXJ5GAEgASgJUgVxdWVyeRISCgRwYWdlGAIgASgFUgRwYW'
    'dlEhsKCXBhZ2Vfc2l6ZRgDIAEoBVIIcGFnZVNpemU=');

@$core.Deprecated('Use searchResponseDescriptor instead')
const SearchResponse$json = {
  '1': 'SearchResponse',
  '2': [
    {'1': 'music_list', '3': 1, '4': 3, '5': 11, '6': '.music.Music', '10': 'musicList'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
  ],
};

/// Descriptor for `SearchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchResponseDescriptor = $convert.base64Decode(
    'Cg5TZWFyY2hSZXNwb25zZRIrCgptdXNpY19saXN0GAEgAygLMgwubXVzaWMuTXVzaWNSCW11c2'
    'ljTGlzdBIUCgV0b3RhbBgCIAEoBVIFdG90YWw=');

@$core.Deprecated('Use musicDescriptor instead')
const Music$json = {
  '1': 'Music',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'artist', '3': 3, '4': 1, '5': 9, '10': 'artist'},
    {'1': 'album', '3': 4, '4': 1, '5': 9, '10': 'album'},
    {'1': 'duration', '3': 5, '4': 1, '5': 5, '10': 'duration'},
  ],
};

/// Descriptor for `Music`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List musicDescriptor = $convert.base64Decode(
    'CgVNdXNpYxIOCgJpZBgBIAEoCVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhYKBmFydGlzdB'
    'gDIAEoCVIGYXJ0aXN0EhQKBWFsYnVtGAQgASgJUgVhbGJ1bRIaCghkdXJhdGlvbhgFIAEoBVII'
    'ZHVyYXRpb24=');

@$core.Deprecated('Use uploadRequestDescriptor instead')
const UploadRequest$json = {
  '1': 'UploadRequest',
  '2': [
    {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.music.MusicMetadata', '9': 0, '10': 'metadata'},
    {'1': 'chunk_data', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'chunkData'},
  ],
  '8': [
    {'1': 'data'},
  ],
};

/// Descriptor for `UploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadRequestDescriptor = $convert.base64Decode(
    'Cg1VcGxvYWRSZXF1ZXN0EjIKCG1ldGFkYXRhGAEgASgLMhQubXVzaWMuTXVzaWNNZXRhZGF0YU'
    'gAUghtZXRhZGF0YRIfCgpjaHVua19kYXRhGAIgASgMSABSCWNodW5rRGF0YUIGCgRkYXRh');

@$core.Deprecated('Use musicMetadataDescriptor instead')
const MusicMetadata$json = {
  '1': 'MusicMetadata',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'artist', '3': 2, '4': 1, '5': 9, '10': 'artist'},
    {'1': 'album', '3': 3, '4': 1, '5': 9, '10': 'album'},
  ],
};

/// Descriptor for `MusicMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List musicMetadataDescriptor = $convert.base64Decode(
    'Cg1NdXNpY01ldGFkYXRhEhQKBXRpdGxlGAEgASgJUgV0aXRsZRIWCgZhcnRpc3QYAiABKAlSBm'
    'FydGlzdBIUCgVhbGJ1bRgDIAEoCVIFYWxidW0=');

@$core.Deprecated('Use uploadResponseDescriptor instead')
const UploadResponse$json = {
  '1': 'UploadResponse',
  '2': [
    {'1': 'music_id', '3': 1, '4': 1, '5': 9, '10': 'musicId'},
    {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadResponseDescriptor = $convert.base64Decode(
    'Cg5VcGxvYWRSZXNwb25zZRIZCghtdXNpY19pZBgBIAEoCVIHbXVzaWNJZBIYCgdzdWNjZXNzGA'
    'IgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');

