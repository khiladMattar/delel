import 'package:daiel/core/models/data_model.dart';
import 'package:daiel/core/utils/app_string.dart';

class WarsModel extends DataModel {
  WarsModel({required super.name, required super.image, required super.discription});
  factory WarsModel.fromJson(jsonData) {
    return WarsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.description],
    );
  }
}