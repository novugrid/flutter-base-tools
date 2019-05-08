part of flutter_base_tools;

/// created by dammyololade
/// created on 2019-04-30
/// project 
class BlocModel<T>{
  List<T> model;
  bool processing;
  BlockAction action;
  T baseModel;

  BlocModel({this.model, this.processing, this.action, this.baseModel});
}

enum BlockAction{
  LoadMore,
  Search,
  Fetch,
  Refresh,
  Filter,
  Done,
}

enum ManageStreamAction{
  Add,
  Remove,
  Update,
}