import 'package:techblog/components/api_constant.dart';

class SingleArticleModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  SingleArticleModel();

  SingleArticleModel.fromJson(element) {
    var data = element['info'];
    id = data['id'];
    title = data['title'];
    content = data['content'];
    image = ApiConstant.hostDlUrl + data['image'];
    catId = data['cat_id'];
    catName = data['cat_name'];
    author = data['author'];
    view = data['view'];
    status = data['status'];
    createdAt = data['created_at'];
    isFavorite = element['isFavorite'];
  }
}
