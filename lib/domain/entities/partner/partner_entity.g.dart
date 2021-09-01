// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerEntity _$PartnerEntityFromJson(Map<String, dynamic> json) {
  return PartnerEntity(
    id: json['id'] as String?,
    name: json['name'] as String?,
    logoUrl: json['logoUrl'] as String?,
    hyperlinkUrl: json['hyperlinkUrl'] as String?,
  );
}

Map<String, dynamic> _$PartnerEntityToJson(PartnerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'hyperlinkUrl': instance.hyperlinkUrl,
    };
