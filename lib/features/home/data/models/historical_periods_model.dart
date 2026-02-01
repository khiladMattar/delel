

import 'package:daiel/core/models/data_model.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/features/home/data/models/wars_model.dart';

class HistoricalPeriodsModel extends DataModel {

  final List<WarsModel> warsList;

  HistoricalPeriodsModel({
    required super.name,
    required super.image,
    required super.discription,
    required this.warsList,
  });
  factory HistoricalPeriodsModel.fromJson(jsonData,warsList) {
    return HistoricalPeriodsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.description],
      warsList: warsList,
      // warsList: (jsonData[FireBaseStrings.wars] as List<dynamic>)
      //     .map((e) => WarsModel.fromJson(e))
      //     .toList(),
    );
  }
}