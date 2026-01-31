import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_model.freezed.dart';
part 'network_model.g.dart';

@freezed
abstract class NetworkModel with _$NetworkModel {
  const factory NetworkModel({
    required String id,
    required String name,
    @JsonKey(name: 'kind') required String kind,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'parent_network_id') String? parentNetworkId,
    String? website,
    String? notes,
  }) = _NetworkModel;

  factory NetworkModel.fromJson(Map<String, dynamic> json) => _$NetworkModelFromJson(json);
}
