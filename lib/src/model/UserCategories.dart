
import 'package:flutter_base_tools/src/model/base_model.dart';

///
/// project: flutter_base_tools
/// @package: src.helpers
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-07
class UserCategories extends BaseModel{
  static String cUserId = "userId";
  static String cCategories = "categories";

  String userId;
  List categoryIds;

  UserCategories.fromMap(Map data){
    createObjectFromMap(data);
  }

  @override
  createObjectFromMap(Map data) {
    userId = data[cUserId];
    categoryIds = data[cCategories];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      cUserId : userId,
      cCategories : categoryIds
    };
  }
}