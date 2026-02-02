import 'package:daiel/core/models/data_model.dart';
import 'package:daiel/core/widgets/custom_data_list_view_item.dart';
import 'package:daiel/features/home/presentaion/widgets/historical_periods.dart';
import 'package:flutter/material.dart';

class CustomDataListView extends StatelessWidget {
   CustomDataListView({
    super.key,
    required this.dataList
, required this.routePath
  });
  final List<DataModel> dataList;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 96,
        child: ListView.separated(
          clipBehavior: Clip.antiAlias,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomDataListViewItem(
              model: dataList[index],
              routePath: routePath,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemCount: dataList.length,
        ),
      );
  }
}