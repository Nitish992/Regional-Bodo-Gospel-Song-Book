import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:song_book/controllers/controller.dart';

class HomePage extends GetView<SongController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Bodo Gospel Song Book"))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  onChanged: (value) => controller.filterSongs(value),
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Search a Song",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      suffixIcon: const Icon(Icons.search),
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: controller.foundSongs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() {
                                Get.toNamed('/lyric', arguments: index);
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              }),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(5),
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue.shade100),
                                child: Text(
                                  "${controller.foundSongs[index].id}. ${controller.foundSongs[index].songTitle}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
