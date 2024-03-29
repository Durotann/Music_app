import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Music {
  String? id;
  String? title;
  String? album;
  String? artist;
  String? genre;
  String? source;
  String? image;
  int? trackNumber;
  int? totalTrackCount;
  int? duration;
  String? site;

  Music({
    required this.id,
    required this.title,
    required this.album,
    required this.artist,
    required this.genre,
    required this.source,
    required this.image,
    required this.trackNumber,
    required this.totalTrackCount,
    required this.site,
    required this.duration,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
        id: json["id"] as String,
        title: json['title'] as String,
        album: json['album'] as String,
        artist: json['artist'] as String,
        genre: json['genre'] as String,
        source: json['source'] as String,
        image: json['image'] as String,
        trackNumber: json['trackNumber'] as int,
        totalTrackCount: json['totalTrackCount'] as int,
        duration: json['duration'] as int,
        site: json['site'] as String);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['album'] = this.album;
    data['artist'] = this.artist;
    data['genre'] = this.genre;
    data['source'] = this.source;
    data['image'] = this.image;
    data['trackNumber'] = this.trackNumber;
    data['totalTrackCount'] = this.totalTrackCount;
    data['duration'] = this.duration;
    data['site'] = this.site;
    return data;
  }
}
