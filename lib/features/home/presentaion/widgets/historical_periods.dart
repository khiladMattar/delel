import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/core/widgets/custom_shimmer_category.dart';
import 'package:daiel/features/home/data/models/historical_periods_model.dart';
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
              : SizedBox(
                  height: 96,
                  child: ListView.separated(
                    clipBehavior: Clip.antiAlias,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HistoricalPeriodItem(
                        historicalPeriodsModel: context
                            .read<HomeCubit>()
                            .historicalPeriods[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: context
                        .read<HomeCubit>()
                        .historicalPeriods
                        .length,
                  ),
                );
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

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.historicalPeriodsModel});
  // final String periodName = "Ancient Egypt";
  // final String imagePath = Assets.imagesFrame;

  final HistoricalPeriodsModel historicalPeriodsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            offset: const Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 70,
            height: 48,
            child: Text(
              historicalPeriodsModel.name,
              style: CustomTextStyles.poppins500style18.copyWith(
                fontSize: 12,
                color: AppColors.deepBrown,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: 64,
            height: 47,
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: historicalPeriodsModel.image,
              placeholder: (context, url) => Shimmer.fromColors(
                child: Container(width: 22, height: 64),
                baseColor: AppColors.grey,
                highlightColor: Colors.white,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
