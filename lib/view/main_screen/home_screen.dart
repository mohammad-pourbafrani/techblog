import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/controller/list_article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_string.dart';
import 'package:techblog/view/article/article_list_screen.dart';
import 'package:techblog/view/article/single_article_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textThem,
    required this.bodyMargin,
  }) : super(key: key);

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final SingleArticleContriller singleArticleContriller =
      Get.put(SingleArticleContriller());

  final Size size;
  final TextTheme textThem;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(
                      height: 16,
                    ),
                    tags(),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMoreBlog(bodyMargin: bodyMargin, textThem: textThem),
                    topVisited(),
                    const SizedBox(
                      height: 24,
                    ),
                    SeeMorePodcast(bodyMargin: bodyMargin, textThem: textThem),
                    topPodcast(),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                )
              : const Loading(),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.topVisitedList.length,
        itemBuilder: ((context, index) {
          //item list view Hottest Blog
          return GestureDetector(
            onTap: () {
              singleArticleContriller.getArticleInfo(
                  int.parse(homeScreenController.topVisitedList[index].id!));

              Get.to(SingleArticleScreen());
            },
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(16, 8, index == 0 ? bodyMargin : 0, 8),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.5,
                    width: size.width / 2.6,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
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
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: textThem.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].view!,
                                    style: textThem.subtitle1,
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
                      homeScreenController.topVisitedList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textThem.headline4,
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

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.topPodcastList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 8, index == 0 ? bodyMargin : 0, 8),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.5,
                  width: size.width / 2.6,
                  child: CachedNetworkImage(
                    imageUrl:
                        homeScreenController.topPodcastList[index].poster!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Loading(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                      color: SolidColors.colorIconImageNotFound,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.6,
                  child: Center(
                    child: Text(
                      homeScreenController.topPodcastList[index].title!,
                      style: textThem.headline4,
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        //backgrand image
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,

          //gradient
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: GradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const Loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: SolidColors.colorIconImageNotFound,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title!,
                style: textThem.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Get.lazyPut(() => ListArticleContriller()
                  .getArticleListWithTagsId(
                      homeScreenController.tagsList[index].id!));
              Get.to(() => ArticleListScreen(
                  title: homeScreenController.tagsList[index].title!));
            },
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainGradientTags(
                textThem: textThem,
                index: index,
                list: homeScreenController.tagsList,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textThem,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.podcastImg.path).image,
            color: SolidColors.colorSeeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyString.viewHottestPodcasts,
            style: textThem.headline3,
          ),
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textThem,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: bodyMargin,
        bottom: 8,
      ),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.penBlue.path).image,
            color: SolidColors.colorSeeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyString.viewHottestBlog,
            style: textThem.headline3,
          )
        ],
      ),
    );
  }
}
