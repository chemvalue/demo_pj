import 'package:demo_pj/models/store.model.dart';
import 'package:get/get.dart';

class UserController{
  late StoreModel storeModel;

  initUser(StoreModel store){
    storeModel = store;
  }
}