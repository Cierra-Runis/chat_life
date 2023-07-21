// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSaveCollection on Isar {
  IsarCollection<Save> get saves => this.collection();
}

const SaveSchema = CollectionSchema(
  name: r'Save',
  id: -1337205359500917504,
  properties: {
    r'createDateTime': PropertySchema(
      id: 0,
      name: r'createDateTime',
      type: IsarType.dateTime,
    ),
    r'latestEditTime': PropertySchema(
      id: 1,
      name: r'latestEditTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _saveEstimateSize,
  serialize: _saveSerialize,
  deserialize: _saveDeserialize,
  deserializeProp: _saveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _saveGetId,
  getLinks: _saveGetLinks,
  attach: _saveAttach,
  version: '3.1.0+1',
);

int _saveEstimateSize(
  Save object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _saveSerialize(
  Save object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createDateTime);
  writer.writeDateTime(offsets[1], object.latestEditTime);
}

Save _saveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Save(
    createDateTime: reader.readDateTime(offsets[0]),
    id: id,
    latestEditTime: reader.readDateTime(offsets[1]),
  );
  return object;
}

P _saveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _saveGetId(Save object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _saveGetLinks(Save object) {
  return [];
}

void _saveAttach(IsarCollection<dynamic> col, Id id, Save object) {}

extension SaveQueryWhereSort on QueryBuilder<Save, Save, QWhere> {
  QueryBuilder<Save, Save, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SaveQueryWhere on QueryBuilder<Save, Save, QWhereClause> {
  QueryBuilder<Save, Save, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Save, Save, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Save, Save, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Save, Save, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SaveQueryFilter on QueryBuilder<Save, Save, QFilterCondition> {
  QueryBuilder<Save, Save, QAfterFilterCondition> createDateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> createDateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> createDateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> createDateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> latestEditTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latestEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> latestEditTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latestEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> latestEditTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latestEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> latestEditTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latestEditTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SaveQueryObject on QueryBuilder<Save, Save, QFilterCondition> {}

extension SaveQueryLinks on QueryBuilder<Save, Save, QFilterCondition> {}

extension SaveQuerySortBy on QueryBuilder<Save, Save, QSortBy> {
  QueryBuilder<Save, Save, QAfterSortBy> sortByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> sortByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.desc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> sortByLatestEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestEditTime', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> sortByLatestEditTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestEditTime', Sort.desc);
    });
  }
}

extension SaveQuerySortThenBy on QueryBuilder<Save, Save, QSortThenBy> {
  QueryBuilder<Save, Save, QAfterSortBy> thenByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> thenByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.desc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> thenByLatestEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestEditTime', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> thenByLatestEditTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latestEditTime', Sort.desc);
    });
  }
}

extension SaveQueryWhereDistinct on QueryBuilder<Save, Save, QDistinct> {
  QueryBuilder<Save, Save, QDistinct> distinctByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDateTime');
    });
  }

  QueryBuilder<Save, Save, QDistinct> distinctByLatestEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latestEditTime');
    });
  }
}

extension SaveQueryProperty on QueryBuilder<Save, Save, QQueryProperty> {
  QueryBuilder<Save, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Save, DateTime, QQueryOperations> createDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDateTime');
    });
  }

  QueryBuilder<Save, DateTime, QQueryOperations> latestEditTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latestEditTime');
    });
  }
}
