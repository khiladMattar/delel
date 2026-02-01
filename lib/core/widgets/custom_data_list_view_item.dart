import 'package:cached_network_image/cached_network_image.dart';
import 'package:daiel/core/models/data_model.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem({super.key, required this.dataModel});
  // final String periodName = "Ancient Egypt";
  // final String imagePath = Assets.imagesFrame;

  final DataModel dataModel;
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
              dataModel.name,
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
            width: 47,
            height: 64,
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: dataModel.image,
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
