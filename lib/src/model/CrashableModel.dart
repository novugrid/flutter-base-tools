part of flutter_base_tools;

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


  CrashableModel({this.uploadableImages, this.itemName, this.description,
      this.condition, this.categoryName, this.categoryId, this.imageIndex});

  Map<String, dynamic> toJson() => {
    "images" : this.uploadableImages.map((v) => v.toJson()).toList(),
    "itemName" : itemName,
    "description" : description,
    "condition" : condition,
    "categoryName" : categoryName,
    "categoryId" : categoryId,
    "imageIndex" : imageIndex,
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
  }
}