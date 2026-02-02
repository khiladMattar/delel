import 'package:daiel/features/home/data/models/historical_periods_model.dart';
import 'package:daiel/features/home/presentaion/widgets/home_sections/home_app_bar_section.dart';
import 'package:daiel/features/home/presentaion/widgets/period_details_section.dart';
import 'package:daiel/features/home/presentaion/widgets/period_wars_section.dart';
import 'package:daiel/features/home/presentaion/widgets/recommendation_section.dart';
import 'package:daiel/features/home/presentaion/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBarSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          SliverToBoxAdapter(
              child: PeriodDetailsSection(
            periodName: model.name,
            description: model.discription,
            imageUrl: model.image,
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 22)),
          SliverToBoxAdapter(
              child: PeriodWarsSection(
            warsList: model.warsList,
          )),
           SliverToBoxAdapter(child: RecommendationsSection(name: model.name,)),
          const SliverToBoxAdapter(child: TrendingSection()),
        ],
      ),
    ));
  }
}

