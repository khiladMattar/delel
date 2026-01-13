import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/widgets/custom_header_text.dart';
import 'package:daiel/features/home/presentaion/widgets/custom_category_list_view.dart' show CustomCategoryListView;
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalCharacters),
        SizedBox(height: 16),
        CustomCategoryListView(),
        SizedBox(height: 32),
      ],
    );
  }
}