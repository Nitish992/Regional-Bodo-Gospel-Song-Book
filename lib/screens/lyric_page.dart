import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:get/get.dart';
import 'package:song_book/controllers/controller.dart';

class LyricPage extends StatelessWidget {
  LyricPage({Key? key}) : super(key: key);

  final SongController lyriccontroller = Get.put(SongController());
  final _index = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Song Lyric")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(lyriccontroller.songList[_index].songTitle.toString(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 40),
                      child: Center(
                        child: RichText(
                          text: HTML.toTextSpan(
                              context, lyriccontroller.songList[_index].lyric),
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.4,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
