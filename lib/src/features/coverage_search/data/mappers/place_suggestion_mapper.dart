import 'package:hamqrg/src/features/coverage_search/data/model/place_suggestion_model.dart';
import 'package:hamqrg/src/features/coverage_search/domain/place_suggestion.dart';

class PlaceSuggestionMapper {
  PlaceSuggestion fromModel(PlaceSuggestionModel model) => PlaceSuggestion(
        label: model.label,
        latitude: model.latitude,
        longitude: model.longitude,
        context: model.context,
      );

  List<PlaceSuggestion> fromModels(List<PlaceSuggestionModel> models) =>
      models.map(fromModel).toList();
}
