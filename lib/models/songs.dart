// To parse this JSON data, do
//
//     final songs = songsFromJson(jsonString);

import 'dart:convert';

List<Songs> songsFromJson(String str) =>
    List<Songs>.from(json.decode(str).map((x) => Songs.fromJson(x)));

String songsToJson(List<Songs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Songs {
  Songs({
    required this.songTitle,
    required this.lyric,
    required this.id,
    required this.char,
  });

  final String songTitle;
  final String lyric;
  final int id;
  final String char;

  factory Songs.fromJson(Map<String, dynamic> json) => Songs(
        songTitle: json["song_title"],
        lyric: json["lyric"],
        id: json["id"],
        char: json["char"],
      );

  Map<String, dynamic> toJson() => {
        "song_title": songTitle,
        "lyric": lyric,
        "id": id,
        "char": char,
      };
}
