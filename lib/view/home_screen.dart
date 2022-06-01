import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colors.dart';
import 'package:techblog/my_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textThem,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textThem;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Column(
          children: [
            HomePagePoster(size: size, textThem: textThem),
            const SizedBox(
              height: 16,
            ),
            HomePageTagList(bodyMargin: bodyMargin, textThem: textThem),
            const SizedBox(
              height: 32,
            ),
            SeeMoreBlog(bodyMargin: bodyMargin, textThem: textThem),
            HomePageBlogList(
                size: size, bodyMargin: bodyMargin, textThem: textThem),
            const SizedBox(
              height: 24,
            ),
            SeeMorePodcast(bodyMargin: bodyMargin, textThem: textThem),
            HomePagePodcastList(
                size: size, bodyMargin: bodyMargin, textThem: textThem),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textThem,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: podcastList.getRange(0, 5).length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 8, index == 0 ? bodyMargin : 0, 8),
            child: Column(
              children: [
                Container(
                  height: size.height / 5.8,
                  width: size.width / 3.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(podcastList[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width / 3.1,
                  child: Center(
                    child: Text(
                      podcastList[index].title,
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
            Assets.icons.podcastImg,
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

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textThem,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.6,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: blogList.getRange(0, 5).length,
        itemBuilder: ((context, index) {
          //item list view Hottest Blog
          return Padding(
            padding: EdgeInsets.fromLTRB(16, 8, index == 0 ? bodyMargin : 0, 8),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.5,
                  width: size.width / 2.6,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                                colors: GradiantColors.blogPost,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textThem.subtitle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
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
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textThem.headline4,
                  ),
                ),
              ],
            ),
          );
        }),
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
            Assets.icons.penBlue,
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

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textThem,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: GradiantColors.tags,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.icons.hashtag,
                      color: Colors.white,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      tagList[index].title,
                      style: textThem.headline2,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textThem,
  }) : super(key: key);

  final Size size;
  final TextTheme textThem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //backgrand image
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap["imageAsset"]),
              fit: BoxFit.cover,
            ),
          ),
          //gradient
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: GradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textThem.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
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
              Text(
                homePagePosterMap["title"],
                style: textThem.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
