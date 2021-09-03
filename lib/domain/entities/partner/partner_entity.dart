import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_entity.g.dart';

@JsonSerializable()
class PartnerEntity extends Equatable {
  final String? id;
  final String? name;
  final String? logoUrl;
  final String? hyperlinkUrl;

  @override
  List<Object?> get props => [id, name, logoUrl, hyperlinkUrl];

  PartnerEntity({required this.id, required this.name, required this.logoUrl, required this.hyperlinkUrl});

  factory PartnerEntity.fromJson(Map<String, dynamic> json) => _$PartnerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerEntityToJson(this);
}
