

///
/// project: flutter_base_tools
/// @package: src.model
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-04
class UploadableImage {
  
  String localImageFile;
  String onlineUrl;
  int index, anotherField;
  String tag;


  UploadableImage({this.localImageFile, this.onlineUrl, this.index, this.anotherField, this.tag});

  Map<String, dynamic> toJson() => {
      "localImageFile" : localImageFile,
      "onlineUrl" : onlineUrl,
      "index" : index,
      "tag" : tag,
  };
  
  UploadableImage.fromJson(Map<String, dynamic> map)
  {
    localImageFile = map["localImageFile"];
    onlineUrl = map["onlineUrl"];
    index = map["index"];
    tag = map["tag"];
  }

}