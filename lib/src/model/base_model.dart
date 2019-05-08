part of flutter_base_tools;

// Created By: Lekan Olad
// Machine : appy
// Date: 28/07/2018 
// Time: 9:09 AM
abstract class BaseModel {

  Map<String, dynamic> toMap();
  createObjectFromMap(Map data);

}