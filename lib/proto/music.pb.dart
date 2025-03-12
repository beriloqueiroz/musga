//
//  Generated code. Do not modify.
//  source: music.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StreamRequest extends $pb.GeneratedMessage {
  factory StreamRequest({
    $core.String? musicId,
    $core.int? startPosition,
  }) {
    final $result = create();
    if (musicId != null) {
      $result.musicId = musicId;
    }
    if (startPosition != null) {
      $result.startPosition = startPosition;
    }
    return $result;
  }
  StreamRequest._() : super();
  factory StreamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'musicId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'startPosition', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamRequest clone() => StreamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamRequest copyWith(void Function(StreamRequest) updates) => super.copyWith((message) => updates(message as StreamRequest)) as StreamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamRequest create() => StreamRequest._();
  StreamRequest createEmptyInstance() => create();
  static $pb.PbList<StreamRequest> createRepeated() => $pb.PbList<StreamRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamRequest>(create);
  static StreamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get musicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set musicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMusicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMusicId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startPosition => $_getIZ(1);
  @$pb.TagNumber(2)
  set startPosition($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartPosition() => clearField(2);
}

class AudioChunk extends $pb.GeneratedMessage {
  factory AudioChunk({
    $core.List<$core.int>? data,
    $core.int? sequenceNumber,
    $core.String? type,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (sequenceNumber != null) {
      $result.sequenceNumber = sequenceNumber;
    }
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  AudioChunk._() : super();
  factory AudioChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AudioChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AudioChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'sequenceNumber', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AudioChunk clone() => AudioChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AudioChunk copyWith(void Function(AudioChunk) updates) => super.copyWith((message) => updates(message as AudioChunk)) as AudioChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AudioChunk create() => AudioChunk._();
  AudioChunk createEmptyInstance() => create();
  static $pb.PbList<AudioChunk> createRepeated() => $pb.PbList<AudioChunk>();
  @$core.pragma('dart2js:noInline')
  static AudioChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AudioChunk>(create);
  static AudioChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get sequenceNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set sequenceNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSequenceNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSequenceNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class SearchRequest extends $pb.GeneratedMessage {
  factory SearchRequest({
    $core.String? query,
    $core.int? page,
    $core.int? pageSize,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    if (page != null) {
      $result.page = page;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    return $result;
  }
  SearchRequest._() : super();
  factory SearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequest clone() => SearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequest copyWith(void Function(SearchRequest) updates) => super.copyWith((message) => updates(message as SearchRequest)) as SearchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRequest create() => SearchRequest._();
  SearchRequest createEmptyInstance() => create();
  static $pb.PbList<SearchRequest> createRepeated() => $pb.PbList<SearchRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequest>(create);
  static SearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => clearField(3);
}

class SearchResponse extends $pb.GeneratedMessage {
  factory SearchResponse({
    $core.Iterable<Music>? musicList,
    $core.int? total,
    $core.Iterable<MusicMetadata>? metadataList,
  }) {
    final $result = create();
    if (musicList != null) {
      $result.musicList.addAll(musicList);
    }
    if (total != null) {
      $result.total = total;
    }
    if (metadataList != null) {
      $result.metadataList.addAll(metadataList);
    }
    return $result;
  }
  SearchResponse._() : super();
  factory SearchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..pc<Music>(1, _omitFieldNames ? '' : 'musicList', $pb.PbFieldType.PM, subBuilder: Music.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'total', $pb.PbFieldType.O3)
    ..pc<MusicMetadata>(3, _omitFieldNames ? '' : 'metadataList', $pb.PbFieldType.PM, subBuilder: MusicMetadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchResponse clone() => SearchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchResponse copyWith(void Function(SearchResponse) updates) => super.copyWith((message) => updates(message as SearchResponse)) as SearchResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResponse create() => SearchResponse._();
  SearchResponse createEmptyInstance() => create();
  static $pb.PbList<SearchResponse> createRepeated() => $pb.PbList<SearchResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponse>(create);
  static SearchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Music> get musicList => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<MusicMetadata> get metadataList => $_getList(2);
}

class Music extends $pb.GeneratedMessage {
  factory Music({
    $core.String? id,
    $core.String? title,
    $core.String? artist,
    $core.String? album,
    $core.int? duration,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (artist != null) {
      $result.artist = artist;
    }
    if (album != null) {
      $result.album = album;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    return $result;
  }
  Music._() : super();
  factory Music.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Music.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Music', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'artist')
    ..aOS(4, _omitFieldNames ? '' : 'album')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Music clone() => Music()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Music copyWith(void Function(Music) updates) => super.copyWith((message) => updates(message as Music)) as Music;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Music create() => Music._();
  Music createEmptyInstance() => create();
  static $pb.PbList<Music> createRepeated() => $pb.PbList<Music>();
  @$core.pragma('dart2js:noInline')
  static Music getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Music>(create);
  static Music? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get artist => $_getSZ(2);
  @$pb.TagNumber(3)
  set artist($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasArtist() => $_has(2);
  @$pb.TagNumber(3)
  void clearArtist() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get album => $_getSZ(3);
  @$pb.TagNumber(4)
  set album($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlbum() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlbum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);
}

enum UploadRequest_Data {
  metadata, 
  chunkData, 
  notSet
}

class UploadRequest extends $pb.GeneratedMessage {
  factory UploadRequest({
    MusicMetadata? metadata,
    $core.List<$core.int>? chunkData,
  }) {
    final $result = create();
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (chunkData != null) {
      $result.chunkData = chunkData;
    }
    return $result;
  }
  UploadRequest._() : super();
  factory UploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UploadRequest_Data> _UploadRequest_DataByTag = {
    1 : UploadRequest_Data.metadata,
    2 : UploadRequest_Data.chunkData,
    0 : UploadRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<MusicMetadata>(1, _omitFieldNames ? '' : 'metadata', subBuilder: MusicMetadata.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'chunkData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadRequest clone() => UploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadRequest copyWith(void Function(UploadRequest) updates) => super.copyWith((message) => updates(message as UploadRequest)) as UploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadRequest create() => UploadRequest._();
  UploadRequest createEmptyInstance() => create();
  static $pb.PbList<UploadRequest> createRepeated() => $pb.PbList<UploadRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadRequest>(create);
  static UploadRequest? _defaultInstance;

  UploadRequest_Data whichData() => _UploadRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MusicMetadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(MusicMetadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  MusicMetadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunkData => $_getN(1);
  @$pb.TagNumber(2)
  set chunkData($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunkData() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkData() => clearField(2);
}

class MusicMetadata extends $pb.GeneratedMessage {
  factory MusicMetadata({
    $core.String? title,
    $core.String? artist,
    $core.String? album,
    $core.String? type,
    $core.int? year,
    $core.String? genre,
    $core.String? composer,
    $core.String? label,
    $core.List<$core.int>? albumArt,
    $core.String? albumArtType,
    $core.String? comments,
    $core.String? isrc,
    $core.String? url,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (artist != null) {
      $result.artist = artist;
    }
    if (album != null) {
      $result.album = album;
    }
    if (type != null) {
      $result.type = type;
    }
    if (year != null) {
      $result.year = year;
    }
    if (genre != null) {
      $result.genre = genre;
    }
    if (composer != null) {
      $result.composer = composer;
    }
    if (label != null) {
      $result.label = label;
    }
    if (albumArt != null) {
      $result.albumArt = albumArt;
    }
    if (albumArtType != null) {
      $result.albumArtType = albumArtType;
    }
    if (comments != null) {
      $result.comments = comments;
    }
    if (isrc != null) {
      $result.isrc = isrc;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  MusicMetadata._() : super();
  factory MusicMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MusicMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MusicMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'artist')
    ..aOS(3, _omitFieldNames ? '' : 'album')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'genre')
    ..aOS(7, _omitFieldNames ? '' : 'composer')
    ..aOS(8, _omitFieldNames ? '' : 'label')
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'albumArt', $pb.PbFieldType.OY)
    ..aOS(10, _omitFieldNames ? '' : 'albumArtType')
    ..aOS(11, _omitFieldNames ? '' : 'comments')
    ..aOS(12, _omitFieldNames ? '' : 'isrc')
    ..aOS(13, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MusicMetadata clone() => MusicMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MusicMetadata copyWith(void Function(MusicMetadata) updates) => super.copyWith((message) => updates(message as MusicMetadata)) as MusicMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MusicMetadata create() => MusicMetadata._();
  MusicMetadata createEmptyInstance() => create();
  static $pb.PbList<MusicMetadata> createRepeated() => $pb.PbList<MusicMetadata>();
  @$core.pragma('dart2js:noInline')
  static MusicMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MusicMetadata>(create);
  static MusicMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get artist => $_getSZ(1);
  @$pb.TagNumber(2)
  set artist($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArtist() => $_has(1);
  @$pb.TagNumber(2)
  void clearArtist() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get album => $_getSZ(2);
  @$pb.TagNumber(3)
  set album($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAlbum() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlbum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get year => $_getIZ(4);
  @$pb.TagNumber(5)
  set year($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasYear() => $_has(4);
  @$pb.TagNumber(5)
  void clearYear() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get genre => $_getSZ(5);
  @$pb.TagNumber(6)
  set genre($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGenre() => $_has(5);
  @$pb.TagNumber(6)
  void clearGenre() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get composer => $_getSZ(6);
  @$pb.TagNumber(7)
  set composer($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasComposer() => $_has(6);
  @$pb.TagNumber(7)
  void clearComposer() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get label => $_getSZ(7);
  @$pb.TagNumber(8)
  set label($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLabel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLabel() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get albumArt => $_getN(8);
  @$pb.TagNumber(9)
  set albumArt($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAlbumArt() => $_has(8);
  @$pb.TagNumber(9)
  void clearAlbumArt() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get albumArtType => $_getSZ(9);
  @$pb.TagNumber(10)
  set albumArtType($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAlbumArtType() => $_has(9);
  @$pb.TagNumber(10)
  void clearAlbumArtType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get comments => $_getSZ(10);
  @$pb.TagNumber(11)
  set comments($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasComments() => $_has(10);
  @$pb.TagNumber(11)
  void clearComments() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get isrc => $_getSZ(11);
  @$pb.TagNumber(12)
  set isrc($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsrc() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsrc() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get url => $_getSZ(12);
  @$pb.TagNumber(13)
  set url($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearUrl() => clearField(13);
}

class UploadResponse extends $pb.GeneratedMessage {
  factory UploadResponse({
    $core.String? musicId,
    $core.bool? success,
    $core.String? message,
  }) {
    final $result = create();
    if (musicId != null) {
      $result.musicId = musicId;
    }
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UploadResponse._() : super();
  factory UploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'music'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'musicId')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadResponse clone() => UploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadResponse copyWith(void Function(UploadResponse) updates) => super.copyWith((message) => updates(message as UploadResponse)) as UploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadResponse create() => UploadResponse._();
  UploadResponse createEmptyInstance() => create();
  static $pb.PbList<UploadResponse> createRepeated() => $pb.PbList<UploadResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadResponse>(create);
  static UploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get musicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set musicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMusicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMusicId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
