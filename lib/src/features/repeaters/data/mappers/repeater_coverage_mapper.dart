import 'package:hamqrg/src/features/repeaters/data/model/coverage/repeater_coverage_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/coverage/repeater_coverage.dart';

class RepeaterCoverageMapper {
  RepeaterCoverage fromModel(RepeaterCoverageModel model) {
    final imageUrl = model.imageUrl ?? model.image;
    if (imageUrl == null) {
      throw StateError('coverage response has no image_url or image');
    }
    return RepeaterCoverage(
      bounds: CoverageBounds(
        north: model.bounds.north,
        south: model.bounds.south,
        east: model.bounds.east,
        west: model.bounds.west,
      ),
      width: model.size.width,
      height: model.size.height,
      imageUrl: imageUrl,
      legend: model.legend
          .map((e) => CoverageLegendStop(dbm: e.dbm, color: e.color))
          .toList(),
    );
  }
}
