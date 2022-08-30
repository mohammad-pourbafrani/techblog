import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/controller/list_article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/view/single_article_screen.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  final ListArticleContriller listArticleContriller =
      Get.put(ListArticleContriller());
  final SingleArticleContriller singleArticleContriller =
      Get.put(SingleArticleContriller());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar("لیست مقاله ها"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              child: Obx(
            () => ListView.builder(
              itemCount: listArticleContriller.articleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleContriller.id.value = int.parse(
                        listArticleContriller.articleList[index].id.toString());
                    Get.to(const SingleArticleScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              listArticleContriller.articleList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            width: Get.width / 3,
                            height: Get.height / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                listArticleContriller.articleList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  listArticleContriller
                                      .articleList[index].author!,
                                  style: textTheme.caption,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  listArticleContriller
                                          .articleList[index].view! +
                                      " بازدید ",
                                  style: textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
        ),
      ),
    );
  }
}
