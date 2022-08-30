import 'package:get/get.dart';
import 'package:techblog/components/api_constant.dart';
import 'package:techblog/services/dio_service.dart';

class SingleArticleContriller extends GetxController {
  RxInt id = RxInt(0);

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleInfo();
  }

  getArticleInfo() async {
    loading.value = true;
    // ignore: todo
    //TODO: get user id from getStorage ApiConstant.getArticleListUrl + userid
    // var response = await DioService().getMethod(ApiConstant.getArticleListUrl);
    // if (response.statusCode == 200) {
    //   response.data.forEach((element) {});

    //   loading.value = false;
    // }
  }
}
