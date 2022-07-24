import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';
import 'package:techblog/view/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 3,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "پروفایل کاربری",
                    style: textThem.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.divaiderColor,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textThem.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.divaiderColor,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textThem.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.divaiderColor,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "تک‌بلاگ در گیت هاب",
                    style: textThem.headline4,
                  ),
                ),
                const Divider(
                  color: SolidColors.divaiderColor,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: SolidColors.scaffoldBg,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image(
                image: Assets.images.logo,
                height: size.height / 13.6,
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeScreen(
                        size: size, textThem: textThem, bodyMargin: bodyMargin),
                    const RegisterIntro(),
                    ProfileScreen(
                        size: size, textThem: textThem, bodyMargin: bodyMargin),
                  ],
                ),
              ),
            ),

            //navigation bar bottem
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: GradiantColors.bottomNav,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    Assets.icons.home,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(
                    Assets.icons.write,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(2),
                  icon: ImageIcon(
                    Assets.icons.user,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
