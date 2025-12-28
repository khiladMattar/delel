

import 'package:daiel/core/cashe/cashe_helper.dart';
import 'package:daiel/core/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited', value: true);
}
