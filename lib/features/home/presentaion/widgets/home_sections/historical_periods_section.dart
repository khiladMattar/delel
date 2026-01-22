import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/widgets/custom_header_text.dart';
import 'package:daiel/features/home/presentaion/widgets/historical_periods.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricalPeriodsSection extends StatelessWidget {
   HistoricalPeriodsSection({super.key});
FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        SizedBox(height: 16),
       HistoricalPeriods(),
        SizedBox(height: 32),
      ],
    );
  }
}
