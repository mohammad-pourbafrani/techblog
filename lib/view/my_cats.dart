import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/data_models.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/components/my_colors.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_string.dart';
import 'dart:developer' as developer;

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  SvgPicture.asset(
                    Assets.images.techbot.path,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: MyString.successfulRegistraition,
                      style: textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: " نام و نام خانوادگی",
                      hintStyle: textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyString.textcategori,
                    style: textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: ((contex, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add(tagList[index]);
                              }
                            });
                          },
                          child: MainGradientTags(
                            textThem: textTheme,
                            index: index,
                            list: tagList,
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Image.asset(
                    Assets.images.downArrow.path,
                    scale: 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.25,
                      ),
                      itemBuilder: ((contex, index) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: SolidColors.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  selectedTags[index].title,
                                  style: textTheme.headline4,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
