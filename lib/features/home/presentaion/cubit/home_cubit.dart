import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/features/home/data/models/historical_periods_model.dart';
import 'package:daiel/features/home/data/models/wars_model.dart';
import 'package:daiel/features/home/presentaion/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsList = [];
  getHistoricalPeridos() async {
   

    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((value) {
            value.docs.forEach((element) async {
              await addWars(element);
              historicalPeriods.add(
                HistoricalPeriodsModel.fromJson(element.data(), warsList),
              );
                    emit(GetHistoricalPeriodsSuccess());

            });
          });
    
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errMessage: e.toString()));
    }
  }

  Future<void> addWars(QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FireBaseStrings.historicalPeriods)
        .doc(element.id)
        .collection(FireBaseStrings.wars)
        .get()
        .then((value) {
          for (var element in value.docs) {
            warsList.add(WarsModel.fromJson(element.data()));
          }
        });
  }
}
