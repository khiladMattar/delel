import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/features/home/data/models/historical_periods_model.dart';
import 'package:daiel/features/home/presentaion/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  List<HistoricalPeriodsModel> historicalPeriods = [];
  getHistoricalPeridos() async {
    print({"£££££££££££££££££ this is cubit method called${historicalPeriods}"});
    
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get()
          .then((value) {
            value.docs.forEach((element) {
              historicalPeriods.add(
                HistoricalPeriodsModel.fromJson(element.data()),
              );
            });
          });
           print({"£££££££££££££££££ this is cubit method called${historicalPeriods.first.discription}"});
                emit(GetHistoricalPeriodsSuccess());

    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(errMessage: e.toString()));
    }
  }
}
