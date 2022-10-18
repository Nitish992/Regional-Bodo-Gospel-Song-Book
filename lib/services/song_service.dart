import 'package:http/http.dart' as http;
import 'package:song_book/models/songs.dart';

class SongService {
  static var client = http.Client();

  static Future<List<Songs>> fetchsongs() async {
    var response = await client.get(Uri.parse("https://p6p8m5.deta.dev/"));
    // print(response.body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return songsFromJson(jsonString);
    } else {
      return [];
    }
  }
}
