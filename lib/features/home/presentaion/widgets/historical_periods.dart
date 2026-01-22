import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/core/widgets/custom_shimmer_category.dart';
import 'package:daiel/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    List<HistoricalPeriodsModel> HistoricalPeriods = [];

    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('historical_periods').get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final listdata = snapshot.data!.docs;
          for (int i = 0; i < listdata.length; i++) {
            HistoricalPeriods.add(
              HistoricalPeriodsModel.fromJson(listdata[i].data()),
            );
          }

          return SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HistoricalPeriodItem(
                  historicalPeriodsModel: HistoricalPeriods[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
              itemCount: HistoricalPeriods.length,
            ),
          );
        }
       return  CustomShimmerCategory();
      
      },
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(historicalPeriodsModel.image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
