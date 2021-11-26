import 'package:demo_pj/models/temp_model.dart';

const String cOTP = '123456';
const String cEMAIL_VALIDATE =
    r"(^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$)";
const String cPHONE_VALIDATE = r'(^(?:[+0][0-9])?[0-9]{10}$)';

const String cPRIMARY_BUTTON_COLOR = '#7E141C';
const String cTEXT_COLOR = '#323239';
const String cHINT_COLOR = '#797C8D';
const String cINPUTFIELD_COLOR = '#EAECF4';

List<TempModel> cityList = [
  TempModel(id: 1, name: 'Hà Nội'),
  TempModel(id: 2, name: 'Hà Tĩnh')
];

List<TempModel> districtList1 = [
  TempModel(id: 1, name: 'Cầu Giấy'),
  TempModel(id: 2, name: 'Hoàng Mai')
];

List<TempModel> districtList2 = [
  TempModel(id: 1, name: 'Nghi Xuân'),
  TempModel(id: 2, name: 'Đức Thọ')
];

List<TempModel> townList1 = [
  TempModel(id: 1, name: 'Trung Hoà'),
  TempModel(id: 2, name: 'Yên Hoà')
];

List<TempModel> townList2 = [
  TempModel(id: 1, name: 'Hoàng Liệt'),
  TempModel(id: 2, name: 'Yên Sở')
];

List<TempModel> townList3 = [
  TempModel(id: 1, name: 'Xuân Hồng'),
  TempModel(id: 2, name: 'Xuân Lam')
];

List<TempModel> townList4 = [
  TempModel(id: 1, name: 'Đức Thanh'),
  TempModel(id: 2, name: 'Đức An')
];

List<TempModel> distributors = [
  TempModel(id: 1, name: 'Honda'),
  TempModel(id: 2, name: 'Yamaha')
];