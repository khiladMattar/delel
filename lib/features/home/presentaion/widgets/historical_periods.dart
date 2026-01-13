
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HistoricalPeriods extends StatelessWidget {
//   const HistoricalPeriods({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {
//         if (state is GetHistoricalPeriodsFailure) {
//           showToast(state.errMessage);
//         }
//       },
//       builder: (context, state) {
//         return state is GetHistoricalPeriodsLoading
//             ? const CustomShimmerCategory()
//             : CustomDataListView(
//                 dataList: context.read<HomeCubit>().historicalPeriods,
//                 routePath:"/historicalPeriodsDetailsView",
//               );
//       },
//     );
//   }
// }

import 'package:daiel/core/utils/app_assets.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: HistoricalPeriodItem()
        ),
        const SizedBox(width: 16),
         Expanded(
          child: HistoricalPeriodItem()
        ),
      ],
    );
  }
}
class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 164,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color:AppColors.grey,
            blurRadius: 10,
            offset: const Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         SizedBox(
          width: 62,
          height: 48,
           child: Text(
            "Ancient Egypt",
            style: CustomTextStyles.poppins500style18.copyWith(
             fontSize: 14,
              color: AppColors.deepBrown
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
            image: AssetImage(Assets.imagesFrame))
            ,),)
        ,

        ],
      )
    );
  }
}