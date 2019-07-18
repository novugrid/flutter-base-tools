
import 'package:flutter_base_tools/src/model/UploadableImage.dart';

///
/// project: flutter_base_tools
/// @package: src.model
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-05
class CrashableModel {
  List<UploadableImage> uploadableImages;
  String itemName;
  String description;
  String condition;
  String categoryName, categoryId;
  int imageIndex;
  String crashAbleAction;

  static const String ACTION_PROFILE = "profile";
  static const String ACTION_ADD_ITEM = "add_item";


  CrashableModel({this.uploadableImages, this.itemName, this.description,
      this.condition, this.categoryName, this.categoryId, this.imageIndex,
    this.crashAbleAction
  });

  Map<String, dynamic> toJson() => {
    "images" : this.uploadableImages.map((v) => v.toJson()).toList(),
    "itemName" : itemName,
    "description" : description,
    "condition" : condition,
    "categoryName" : categoryName,
    "categoryId" : categoryId,
    "imageIndex" : imageIndex,
    "crashAbleAction" : crashAbleAction,
  };

  CrashableModel.fromJson(Map<String, dynamic> json)
  {
    uploadableImages = List<UploadableImage>();
    json["images"].forEach((v) {
      uploadableImages.add(UploadableImage.fromJson(v));
    });
    itemName = json["itemName"];
    description = json["description"];
    condition = json["condition"];
    categoryName = json["categoryName"];
    categoryId = json["categoryId"];
    imageIndex = json["imageIndex"];
    crashAbleAction = json["crashAbleAction"];
  }
}