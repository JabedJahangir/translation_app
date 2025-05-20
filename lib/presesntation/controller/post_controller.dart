import 'package:get/get.dart';
import 'package:translated_api_app/data/model/post_model.dart';
import 'package:translated_api_app/data/repo/post_repo.dart';


class PostController extends GetxController {
  final PostRepository _repository = PostRepository();
  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var isTranslated = false.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      isError(false);
      final fetchedPosts = await _repository.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      isError(true);
      print('❌ Error in fetchPosts: $e'); // ← Add this line
    } finally {
      isLoading(false);
    }
  }

  Future<void> toggleTranslation() async {
  if (isTranslated.value) {
    await fetchPosts(); // Restore original
  } else {
    isLoading(true);

    try {
      final translatedPosts = <Post>[];

      for (final post in posts) {
        String translatedTitle = post.title;
        String translatedBody = post.body;

        try {
          translatedTitle = await _repository.translateToBangla(post.title);
          translatedBody = await _repository.translateToBangla(post.body);
        } catch (e) {
          print('🔴 Translation failed for post ID ${post.id}: $e');
        }

        translatedPosts.add(Post(
          id: post.id,
          title: translatedTitle,
          body: translatedBody,
          userId: post.userId,
          tags: post.tags,
          reactions: post.reactions,
        ));
      }

      posts.assignAll(translatedPosts);
    } catch (e) {
      print('❌ Error translating posts: $e');
    } finally {
      isLoading(false); // ✅ Ensure this always runs
    }
  }

  isTranslated.toggle();
}

}