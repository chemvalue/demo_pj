class StoreModel {
  StoreModel({
    required this.name,
    required this.phone,
    required this.cityAddress,
    required this.districtAddress,
    required this.townAddress,
    required this.homeAddress,
    required this.distributor,
    required this.imagePath,
  });
  late final String name;
  late final String phone;
  late final String cityAddress;
  late final String districtAddress;
  late final String townAddress;
  late final String homeAddress;
  late final String distributor;
  late final String? imagePath;

  StoreModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    cityAddress = json['city_address'];
    districtAddress = json['district_address'];
    townAddress = json['town_address'];
    homeAddress = json['home_address'];
    distributor = json['distributor'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    _data['city_address'] = cityAddress;
    _data['district_address'] = districtAddress;
    _data['town_address'] = townAddress;
    _data['home_address'] = homeAddress;
    _data['distributor'] = distributor;
    _data['image_path'] = imagePath;
    return _data;
  }
}