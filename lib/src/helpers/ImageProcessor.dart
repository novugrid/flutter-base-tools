part of flutter_base_tools;
///
/// project: flutter_base_tools
/// @package: src.helpers
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-04
class ImageProcessor {

  showModal(BuildContext context, String title)
  {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) =>
            Card(
              margin: EdgeInsets.all(.0),
              child: Container(
                //color: Colors.red.shade50,
                height: 150,
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    new Text(
                      title,
                      style: TextStyle(fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: AppConfig.APP_PRIMARY_COLOR),
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new InkWell(
                          onTap: (){
                            eventBus.fire(ImageSourceSelectedEvent(ImageSource.camera));
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: AppConfig.APP_BOX_COLOR,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: new Column(
                              children: <Widget>[
                                ClipOval(
                                  child: new Container(
                                      padding: EdgeInsets.all(6.0),
                                      child: new Icon(
                                        Icons.camera_alt,
                                        size: 22.0,
                                        color: AppConfig.APP_PRIMARY_COLOR,
                                      )),
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  "CAMERA",
                                  style: TextStyle(
                                      color: AppConfig.APP_PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: (){
                            eventBus.fire(ImageSourceSelectedEvent(ImageSource.gallery));
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: AppConfig.APP_BOX_COLOR,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: new Column(
                              children: <Widget>[
                                ClipOval(
                                  child: new Container(
                                      padding: EdgeInsets.all(6.0),
                                      child: new Icon(
                                        Icons.image,
                                        size: 22.0,
                                        color: AppConfig.APP_PRIMARY_COLOR,
                                      )),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "GALLERY",
                                  style: TextStyle(
                                      color: AppConfig.APP_PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
    );
  }

  Future<StorageTaskSnapshot> uploadFileToServer(File file, String purpose, String fileName) async
  {
    try {
      StorageUploadTask uploadTask;
      final FirebaseStorage storage = FirebaseStorage();
      StorageReference ref = storage.ref().child(purpose).child(fileName);
      uploadTask = ref.putFile(file);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      return taskSnapshot;
    }catch(error){
      eventBus.fire(ErrorEvent(error.toString()));
    }
  }

}