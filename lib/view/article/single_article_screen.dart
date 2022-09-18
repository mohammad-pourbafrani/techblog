import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_string.dart';
import 'package:techblog/controller/list_article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/view/article/article_list_screen.dart';

class SingleArticleScreen extends StatelessWidget {
  SingleArticleScreen({Key? key}) : super(key: key);

  final SingleArticleContriller singleArticleContriller =
      Get.put(SingleArticleContriller());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => singleArticleContriller.loading.value
                ? SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: const Loading())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleContriller
                                .singleArticleInfo.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => Image.asset(
                                Assets.images.singlePlaceHolder.path),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: GradiantColors.singleAppBarGradiant,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.bookmark_border_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          singleArticleContriller
                              .singleArticleInfo.value.title!,
                          style: textTheme.titleLarge!.apply(
                            fontSizeFactor: 1.4,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  Image.asset(Assets.images.profileAvatar.path)
                                      .image,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleContriller
                                  .singleArticleInfo.value.author!,
                              style: textTheme.headline4,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleContriller
                                  .singleArticleInfo.value.createdAt!,
                              style: textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(
                          singleArticleContriller
                              .singleArticleInfo.value.content!,
                          textStyle: textTheme.caption,
                          enableCaching: true,
                          onLoadingBuilder:
                              (context, element, loadingProgress) =>
                                  const Loading(),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              singleArticleContriller.relatedTagsList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.find<ListArticleContriller>()
                                    .getArticleListWithTagsId(
                                        singleArticleContriller
                                            .relatedTagsList[index].id!);
                                Get.to(ArticleListScreen(
                                  title: singleArticleContriller
                                      .relatedTagsList[index].title!,
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: SolidColors
                                          .colorBackgrandTagSingleArticle),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          singleArticleContriller
                                              .relatedTagsList[index].title!,
                                          style: textTheme.headline2!.apply(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          MyString.textSingleArticle,
                          style: textTheme.headline3,
                        ),
                      ),
                      related(size, textTheme),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget related(Size size, TextTheme textTheme) {
    return SizedBox(
      height: size.height / 3.6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleContriller.relatedArticleList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              singleArticleContriller.getArticleInfo(int.parse(
                  singleArticleContriller.relatedArticleList[index].id!));
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, index == 0 ? 16 : 0, 8),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.5,
                    width: size.width / 2.6,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleContriller
                              .relatedArticleList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                    colors: GradiantColors.blogPost,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                          ),
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: SolidColors.colorIconImageNotFound,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                singleArticleContriller
                                    .relatedArticleList[index].author!,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    singleArticleContriller
                                        .relatedArticleList[index].view!,
                                    style: textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.6,
                    child: Text(
                      singleArticleContriller.relatedArticleList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
