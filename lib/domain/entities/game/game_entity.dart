import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_entity.g.dart';

@JsonSerializable()
class GameEntity extends Equatable {
  final String id;
  final String? name;
  final double? priceOriginal;
  final double? priceFinal;
  final String? hyperlinkUrl;
  final bool? groupXboxStore;
  final bool? groupDealsWithGold;

  @override
  List<Object?> get props => [id, name, priceOriginal, priceFinal, hyperlinkUrl, groupXboxStore, groupDealsWithGold];

  GameEntity({required this.id, required this.name, this.priceOriginal, this.priceFinal, this.hyperlinkUrl, this.groupXboxStore, this.groupDealsWithGold});

  factory GameEntity.fromJson(Map<String, dynamic> json) => _$GameEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GameEntityToJson(this);
}
