import 'package:get/get.dart';

class ImageController extends GetxController{
  RxString path = ''.obs;

  void setPath(String value){
    path.value = value;
  }
}