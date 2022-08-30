import 'dart:developer';
import 'package:get/get.dart';
import 'package:techblog/components/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ListArticleContriller extends GetxController {
  RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = true;
    // ignore: todo
    //TODO: get user id from getStorage ApiConstant.getArticleListUrl + userid
    var response = await DioService().getMethod(ApiConstant.getArticleListUrl);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
    log(articleList.toString());
  }
}
