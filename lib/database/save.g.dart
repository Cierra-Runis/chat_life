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
    ),
    r'messagesJsonString': PropertySchema(
      id: 2,
      name: r'messagesJsonString',
      type: IsarType.string,
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
  bytesCount += 3 + object.messagesJsonString.length * 3;
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
  writer.writeString(offsets[2], object.messagesJsonString);
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
    messagesJsonString: reader.readString(offsets[2]),
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
    case 2:
      return (reader.readString(offset)) as P;
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

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'messagesJsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'messagesJsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'messagesJsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'messagesJsonString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'messagesJsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'messagesJsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'messagesJsonString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'messagesJsonString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition> messagesJsonStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'messagesJsonString',
        value: '',
      ));
    });
  }

  QueryBuilder<Save, Save, QAfterFilterCondition>
      messagesJsonStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'messagesJsonString',
        value: '',
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

  QueryBuilder<Save, Save, QAfterSortBy> sortByMessagesJsonString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messagesJsonString', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> sortByMessagesJsonStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messagesJsonString', Sort.desc);
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

  QueryBuilder<Save, Save, QAfterSortBy> thenByMessagesJsonString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messagesJsonString', Sort.asc);
    });
  }

  QueryBuilder<Save, Save, QAfterSortBy> thenByMessagesJsonStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'messagesJsonString', Sort.desc);
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

  QueryBuilder<Save, Save, QDistinct> distinctByMessagesJsonString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'messagesJsonString',
          caseSensitive: caseSensitive);
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

  QueryBuilder<Save, String, QQueryOperations> messagesJsonStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'messagesJsonString');
    });
  }
}
