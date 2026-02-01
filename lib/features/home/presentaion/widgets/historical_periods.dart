import 'package:cached_network_image/cached_network_image.dart';
import 'package:daiel/core/models/data_model.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/core/widgets/custom_data_list_view.dart';
import 'package:daiel/core/widgets/custom_shimmer_category.dart';
import 'package:daiel/features/home/presentaion/cubit/home_cubit.dart';
import 'package:daiel/features/home/presentaion/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeridos(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // if (state is GetHistoricalPeriodsFailure) {
          //   showToast(state.errMessage);
          // }
        },
        builder: (context, state) {
          return state is GetHistoricalPeriodsLoading
              ?  CustomShimmerCategory()
              : CustomDataListView(dataList: context.read<HomeCubit>().historicalPeriods,);
          // return FutureBuilder<QuerySnapshot>(
          //   future: FirebaseFirestore.instance.collection('historical_periods').get(),
          //   builder: (context, snapshot) {
          //     List<HistoricalPeriodsModel> historicalPeriods = [];
          //     if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     }

          //     if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          //       return Text("Document does not exist");
          //     }

          //     if (snapshot.connectionState == ConnectionState.done) {
          //       final listdata = snapshot.data!.docs;
          //       for (int i = 0; i < listdata.length; i++) {
          //         historicalPeriods.add(
          //           HistoricalPeriodsModel.fromJson(listdata[i].data()),
          //         );
          //       }

          //       return SizedBox(
          //         height: 96,
          //         child: ListView.separated(
          //           clipBehavior: Clip.antiAlias,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (context, index) {
          //             return HistoricalPeriodItem(
          //               historicalPeriodsModel: historicalPeriods[index],
          //             );
          //           },
          //           separatorBuilder: (BuildContext context, int index) {
          //             return const SizedBox(width: 10);
          //           },
          //           itemCount: historicalPeriods.length,
          //         ),
          //       );
          //     }
          //     return CustomShimmerCategory();
          //   },
          // );
        },
      ),
    );
  }
}



