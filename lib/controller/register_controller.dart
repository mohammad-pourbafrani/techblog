import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:techblog/components/api_constant.dart';
import 'package:techblog/services/dio_service.dart';

class RegisterController extends GetxController {
  //variable
  TextEditingController emailTextEditeingController = TextEditingController();
  TextEditingController activeCodeTextEditeingController =
      TextEditingController();
  var userId = '';
  var email = '';

  //function
  void register() async {
    Map<String, dynamic> data = {
      'email': emailTextEditeingController.text,
      'command': 'register',
    };

    var response =
        await DioService().postMethod(data, ApiConstant.postRegisterUrl);
    //log(response.toString());
    userId = response.data['user_id'];
    email = emailTextEditeingController.text;
  }

  void verify() async {
    Map<String, dynamic> data = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditeingController.text,
      'command': 'verify',
    };

    var response =
        await DioService().postMethod(data, ApiConstant.postRegisterUrl);
    log(response.toString());
  }
}
