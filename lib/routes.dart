import 'package:get/get.dart';
import 'package:song_book/home_bindings.dart';
import 'package:song_book/screens/home.dart';
import 'package:song_book/screens/lyric_page.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: '/lyric', page: () => LyricPage())
  ];
}
