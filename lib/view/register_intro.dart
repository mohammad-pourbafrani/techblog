import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_string.dart';
import 'package:techblog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcom,
                    style: textThem.headline5,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textThem);
                },
                child: const Text(
                  "بزن بریم",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textThem) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyString.textInsertEmail,
                      style: textThem.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        style: textThem.headline4,
                        onChanged: (value) {},
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "techblog@gmail.com",
                          hintStyle: textThem.headline6,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _activeteCodeBottomSheet(context, size, textThem);
                      },
                      child: const Text("ادامه"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> _activeteCodeBottomSheet(
      BuildContext context, Size size, TextTheme textThem) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyString.textActiveCodEmail,
                      style: textThem.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        style: textThem.headline4,
                        onChanged: (value) {},
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: textThem.headline6,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MyCats(),
                          ),
                        );
                      },
                      child: const Text("ادامه"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
