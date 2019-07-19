

import 'package:image_picker/image_picker.dart';

/// created by dammyololade
/// created on 2019-05-02
/// project

class SuccessEvent
{
  String message, classTag;

  SuccessEvent(this.message, {this.classTag});
}

class LoginErrorEvent
{
  String message;

  LoginErrorEvent(this.message);

}

class ForgetPasswordErrorEvent
{
  String message;

  ForgetPasswordErrorEvent(this.message);
}

class RegisterErrorEvent
{
  String message;

  RegisterErrorEvent(this.message);
}

class ImageSourceSelectedEvent
{
  ImageSource source;

  ImageSourceSelectedEvent(this.source);

}