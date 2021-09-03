// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameEntity _$GameEntityFromJson(Map<String, dynamic> json) {
  return GameEntity(
    id: json['id'] as String,
    name: json['name'] as String?,
    priceOriginal: (json['priceOriginal'] as num?)?.toDouble(),
    priceFinal: (json['priceFinal'] as num?)?.toDouble(),
    hyperlinkUrl: json['hyperlinkUrl'] as String?,
    groupXboxStore: json['groupXboxStore'] as bool?,
    groupDealsWithGold: json['groupDealsWithGold'] as bool?,
  );
}

Map<String, dynamic> _$GameEntityToJson(GameEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'priceOriginal': instance.priceOriginal,
      'priceFinal': instance.priceFinal,
      'hyperlinkUrl': instance.hyperlinkUrl,
      'groupXboxStore': instance.groupXboxStore,
      'groupDealsWithGold': instance.groupDealsWithGold,
    };
