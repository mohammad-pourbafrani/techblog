import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/controller/article_controller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  final ArticleContriller articleContriller = Get.put(ArticleContriller());

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
              itemCount: articleContriller.articleList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: articleContriller.articleList[index].image!,
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
                              articleContriller.articleList[index].title!,
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
                                articleContriller.articleList[index].author!,
                                style: textTheme.caption,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                articleContriller.articleList[index].view! +
                                    " بازدید ",
                                style: textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
