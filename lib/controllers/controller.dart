import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:song_book/models/songs.dart';
import 'package:song_book/services/song_service.dart';

class SongController extends GetxController {
  var isLoading = false.obs;

  var songList = <Songs>[].obs;

  var foundSongs = <Songs>[].obs;

  @override
  void onInit() {
    fetchSongs();
    super.onInit();
    foundSongs.value = songList;
  }

  fetchSongs() async {
    try {
      isLoading(true);
      var songs = await SongService.fetchsongs();
      debugPrint(songs.length.toString());
      songList.assignAll(songs);
    } finally {
      isLoading(false);
    }
  }

  void filterSongs(String songName) {
    var results = <Songs>[];

    if (songName.isEmpty) {
      results = songList;
    } else {
      results = songList
          .where((element) => element.songTitle
              .toString()
              .toLowerCase()
              .contains(songName.toLowerCase()))
          .toList();
    }
    foundSongs.value = results;
  }
}
