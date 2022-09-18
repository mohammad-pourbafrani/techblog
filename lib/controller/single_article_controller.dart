import 'dart:developer';

import 'package:get/get.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/single_article_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class SingleArticleContriller extends GetxController {
  Rx<SingleArticleModel> singleArticleInfo = SingleArticleModel().obs;
  RxList<ArticleModel> relatedArticleList = RxList();
  RxList<TagsModel> relatedTagsList = RxList();

  RxBool loading = false.obs;

  void getArticleInfo(int id) async {
    loading.value = true;
    relatedArticleList.clear();
    relatedTagsList.clear();
    singleArticleInfo = SingleArticleModel().obs;
    var userId = 1;

    // ignore: todo
    //TODO: get user id from getStorage ApiConstant.getArticleListUrl + userid

    //https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=12&user_id=1
    var response = await DioService().getMethod(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      singleArticleInfo.value = SingleArticleModel.fromJson(response.data);

      response.data['related'].forEach((element) {
        relatedArticleList.add(ArticleModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        relatedTagsList.add(TagsModel.fromJson(element));
      });

      log(response.data.toString());

      loading.value = false;
    }
  }
}
