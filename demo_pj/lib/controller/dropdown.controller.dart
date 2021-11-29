import 'package:get/get.dart';

class DropdownController extends GetxController{
  final selected = 1.obs;
  var check = false.obs;

  void setSelected(int value){
    selected.value = value;
  }
}