import 'package:ham_qrg/common/abstracts/mapper.dart';
import 'package:ham_qrg/src/features/home/data/model/home_statistics/home_statistics.dart';
import 'package:ham_qrg/src/features/home/domain/home_statistics/home_statistics.dart';

class HomeMappers implements Mapper<HomeStatistics, HomeStatisticsModel> {
  @override
  HomeStatistics fromModel(HomeStatisticsModel model) {
    return HomeStatistics(
      totalRepeaters: model.totalRepeaters,
      favoritesCount: model.favoritesCount,
    );
  }

  @override
  HomeStatisticsModel toModel(HomeStatistics entity) {
    return HomeStatisticsModel(
      totalRepeaters: entity.totalRepeaters,
      favoritesCount: entity.favoritesCount,
    );
  }
}

