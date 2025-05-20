import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translated_api_app/presesntation/controller/post_controller.dart';
import 'package:translated_api_app/presesntation/screens/post_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr),
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              var locale = Get.locale?.languageCode == 'bn' 
                  ? Locale('en', 'US') 
                  : Locale('bn', 'BD');
              Get.updateLocale(locale);
              controller.toggleTranslation();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.isError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('error'.tr),
                ElevatedButton(
                  onPressed: () => controller.fetchPosts(),
                  child: Text('retry'.tr),
                ),
              ],
            ),
          );
        }
        if (controller.posts.isEmpty) {
          return Center(child: Text('noPosts'.tr));
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return  Card(
  margin: EdgeInsets.all(8),
  child: ListTile(
    title: Text(post.title),
    subtitle: Text(
      post.body.length > 100
          ? '${post.body.substring(0, 100)}...'
          : post.body,
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(label: Text('👍 ${post.reactions['likes'] ?? 0}')),
        SizedBox(width: 4),
        Chip(label: Text('👎 ${post.reactions['dislikes'] ?? 0}')),
      ],
    ),
    onTap: () => Get.to(
      PostDetailScreen(post: post),
      transition: Transition.rightToLeft,
    ),
  ),
);

          },
        );
      }),
    );
  }
}