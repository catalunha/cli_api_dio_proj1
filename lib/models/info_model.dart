import 'dart:convert';

import 'package:collection/collection.dart';

import 'other_model.dart';

class InfoModel {
  final int? id;
  final String? typeString;
  final int? typeInt;
  final double? typeDouble;
  final bool? typeBool;
  final OtherModel? typeOther;
  final List<String>? typeListString;
  final List<OtherModel>? typeListOther;
  InfoModel({
    this.id,
    this.typeString,
    this.typeInt,
    this.typeDouble,
    this.typeBool,
    this.typeOther,
    this.typeListString,
    this.typeListOther,
  });

  InfoModel copyWith({
    int? id,
    String? typeString,
    int? typeInt,
    double? typeDouble,
    bool? typeBool,
    OtherModel? typeOther,
    List<String>? typeListString,
    List<OtherModel>? typeListOther,
  }) {
    return InfoModel(
      id: id ?? this.id,
      typeString: typeString ?? this.typeString,
      typeInt: typeInt ?? this.typeInt,
      typeDouble: typeDouble ?? this.typeDouble,
      typeBool: typeBool ?? this.typeBool,
      typeOther: typeOther ?? this.typeOther,
      typeListString: typeListString ?? this.typeListString,
      typeListOther: typeListOther ?? this.typeListOther,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (typeString != null) {
      result.addAll({'typeString': typeString});
    }
    if (typeInt != null) {
      result.addAll({'typeInt': typeInt});
    }
    if (typeDouble != null) {
      result.addAll({'typeDouble': typeDouble});
    }
    if (typeBool != null) {
      result.addAll({'typeBool': typeBool});
    }
    if (typeOther != null) {
      result.addAll({'typeOther': typeOther!.toMap()});
    }
    if (typeListString != null) {
      result.addAll({'typeListString': typeListString});
    }
    if (typeListOther != null) {
      result.addAll(
          {'typeListOther': typeListOther!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      id: map['id']?.toInt(),
      typeString: map['typeString'],
      typeInt: map['typeInt']?.toInt(),
      typeDouble: map['typeDouble']?.toDouble(),
      typeBool: map['typeBool'],
      typeOther: map['typeOther'] != null
          ? OtherModel.fromMap(map['typeOther'])
          : null,
      typeListString: map['typeListString'] != null
          ? List<String>.from(map['typeListString'])
          : null,
      typeListOther: map['typeListOther'] != null
          ? List<OtherModel>.from(
              map['typeListOther']?.map((x) => OtherModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoModel.fromJson(String source) =>
      InfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InfoModel(id: $id, typeString: $typeString, typeInt: $typeInt, typeDouble: $typeDouble, typeBool: $typeBool, typeOther: $typeOther, typeListString: $typeListString, typeListOther: $typeListOther)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is InfoModel &&
        other.id == id &&
        other.typeString == typeString &&
        other.typeInt == typeInt &&
        other.typeDouble == typeDouble &&
        other.typeBool == typeBool &&
        other.typeOther == typeOther &&
        listEquals(other.typeListString, typeListString) &&
        listEquals(other.typeListOther, typeListOther);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        typeString.hashCode ^
        typeInt.hashCode ^
        typeDouble.hashCode ^
        typeBool.hashCode ^
        typeOther.hashCode ^
        typeListString.hashCode ^
        typeListOther.hashCode;
  }
}
