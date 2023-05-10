// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends DataClass implements Insertable<User> {
  final int? userID;
  final String? name;
  final String? email;
  User({this.userID, this.name, this.email});
  factory User.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      userID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}userID']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userID != null) {
      map['userID'] = Variable<int?>(userID);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userID:
          userID == null && nullToAbsent ? const Value.absent() : Value(userID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userID: serializer.fromJson<int?>(json['userID']),
      name: serializer.fromJson<String?>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<int?>(userID),
      'name': serializer.toJson<String?>(name),
      'email': serializer.toJson<String?>(email),
    };
  }

  User copyWith({int? userID, String? name, String? email}) => User(
        userID: userID ?? this.userID,
        name: name ?? this.name,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userID: $userID, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userID, name, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userID == this.userID &&
          other.name == this.name &&
          other.email == this.email);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int?> userID;
  final Value<String?> name;
  final Value<String?> email;
  const UsersCompanion({
    this.userID = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userID = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int?>? userID,
    Expression<String?>? name,
    Expression<String?>? email,
  }) {
    return RawValuesInsertable({
      if (userID != null) 'userID': userID,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    });
  }

  UsersCompanion copyWith(
      {Value<int?>? userID, Value<String?>? name, Value<String?>? email}) {
    return UsersCompanion(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userID.present) {
      map['userID'] = Variable<int?>(userID.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userID: $userID, ')
          ..write('name: $name, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  final VerificationMeta _userIDMeta = const VerificationMeta('userID');
  late final GeneratedColumn<int?> userID = GeneratedColumn<int?>(
      'userID', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [userID, name, email];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('userID')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['userID']!, _userIDMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Calendar extends DataClass implements Insertable<Calendar> {
  final int? calendarID;
  final int? userID;
  Calendar({this.calendarID, this.userID});
  factory Calendar.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Calendar(
      calendarID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calendarID']),
      userID: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}userID']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || calendarID != null) {
      map['calendarID'] = Variable<int?>(calendarID);
    }
    if (!nullToAbsent || userID != null) {
      map['userID'] = Variable<int?>(userID);
    }
    return map;
  }

  CalendarsCompanion toCompanion(bool nullToAbsent) {
    return CalendarsCompanion(
      calendarID: calendarID == null && nullToAbsent
          ? const Value.absent()
          : Value(calendarID),
      userID:
          userID == null && nullToAbsent ? const Value.absent() : Value(userID),
    );
  }

  factory Calendar.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Calendar(
      calendarID: serializer.fromJson<int?>(json['calendarID']),
      userID: serializer.fromJson<int?>(json['userID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'calendarID': serializer.toJson<int?>(calendarID),
      'userID': serializer.toJson<int?>(userID),
    };
  }

  Calendar copyWith({int? calendarID, int? userID}) => Calendar(
        calendarID: calendarID ?? this.calendarID,
        userID: userID ?? this.userID,
      );
  @override
  String toString() {
    return (StringBuffer('Calendar(')
          ..write('calendarID: $calendarID, ')
          ..write('userID: $userID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(calendarID, userID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Calendar &&
          other.calendarID == this.calendarID &&
          other.userID == this.userID);
}

class CalendarsCompanion extends UpdateCompanion<Calendar> {
  final Value<int?> calendarID;
  final Value<int?> userID;
  const CalendarsCompanion({
    this.calendarID = const Value.absent(),
    this.userID = const Value.absent(),
  });
  CalendarsCompanion.insert({
    this.calendarID = const Value.absent(),
    this.userID = const Value.absent(),
  });
  static Insertable<Calendar> custom({
    Expression<int?>? calendarID,
    Expression<int?>? userID,
  }) {
    return RawValuesInsertable({
      if (calendarID != null) 'calendarID': calendarID,
      if (userID != null) 'userID': userID,
    });
  }

  CalendarsCompanion copyWith({Value<int?>? calendarID, Value<int?>? userID}) {
    return CalendarsCompanion(
      calendarID: calendarID ?? this.calendarID,
      userID: userID ?? this.userID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (calendarID.present) {
      map['calendarID'] = Variable<int?>(calendarID.value);
    }
    if (userID.present) {
      map['userID'] = Variable<int?>(userID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarsCompanion(')
          ..write('calendarID: $calendarID, ')
          ..write('userID: $userID')
          ..write(')'))
        .toString();
  }
}

class Calendars extends Table with TableInfo<Calendars, Calendar> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Calendars(this.attachedDatabase, [this._alias]);
  final VerificationMeta _calendarIDMeta = const VerificationMeta('calendarID');
  late final GeneratedColumn<int?> calendarID = GeneratedColumn<int?>(
      'calendarID', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIDMeta = const VerificationMeta('userID');
  late final GeneratedColumn<int?> userID = GeneratedColumn<int?>(
      'userID', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES users(userID)');
  @override
  List<GeneratedColumn> get $columns => [calendarID, userID];
  @override
  String get aliasedName => _alias ?? 'calendars';
  @override
  String get actualTableName => 'calendars';
  @override
  VerificationContext validateIntegrity(Insertable<Calendar> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('calendarID')) {
      context.handle(
          _calendarIDMeta,
          calendarID.isAcceptableOrUnknown(
              data['calendarID']!, _calendarIDMeta));
    }
    if (data.containsKey('userID')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['userID']!, _userIDMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {calendarID};
  @override
  Calendar map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Calendar.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Calendars createAlias(String alias) {
    return Calendars(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DateTimeData extends DataClass implements Insertable<DateTimeData> {
  final double? time;
  final DateTime? date;
  DateTimeData({this.time, this.date});
  factory DateTimeData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DateTimeData(
      time: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<double?>(time);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime?>(date);
    }
    return map;
  }

  DateTimeCompanion toCompanion(bool nullToAbsent) {
    return DateTimeCompanion(
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory DateTimeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DateTimeData(
      time: serializer.fromJson<double?>(json['time']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'time': serializer.toJson<double?>(time),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  DateTimeData copyWith({double? time, DateTime? date}) => DateTimeData(
        time: time ?? this.time,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('DateTimeData(')
          ..write('time: $time, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(time, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DateTimeData &&
          other.time == this.time &&
          other.date == this.date);
}

class DateTimeCompanion extends UpdateCompanion<DateTimeData> {
  final Value<double?> time;
  final Value<DateTime?> date;
  const DateTimeCompanion({
    this.time = const Value.absent(),
    this.date = const Value.absent(),
  });
  DateTimeCompanion.insert({
    this.time = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<DateTimeData> custom({
    Expression<double?>? time,
    Expression<DateTime?>? date,
  }) {
    return RawValuesInsertable({
      if (time != null) 'time': time,
      if (date != null) 'date': date,
    });
  }

  DateTimeCompanion copyWith({Value<double?>? time, Value<DateTime?>? date}) {
    return DateTimeCompanion(
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (time.present) {
      map['time'] = Variable<double?>(time.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime?>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DateTimeCompanion(')
          ..write('time: $time, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class DateTime extends Table with TableInfo<DateTime, DateTimeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DateTime(this.attachedDatabase, [this._alias]);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  late final GeneratedColumn<double?> time = GeneratedColumn<double?>(
      'time', aliasedName, true,
      type: const RealType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [time, date];
  @override
  String get aliasedName => _alias ?? 'dateTime';
  @override
  String get actualTableName => 'dateTime';
  @override
  VerificationContext validateIntegrity(Insertable<DateTimeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {time, date};
  @override
  DateTimeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DateTimeData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  DateTime createAlias(String alias) {
    return DateTime(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY (time, date)'];
  @override
  bool get dontWriteConstraints => true;
}

class Ingredient extends DataClass implements Insertable<Ingredient> {
  final String? name;
  final double? costPer100g;
  Ingredient({this.name, this.costPer100g});
  factory Ingredient.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Ingredient(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      costPer100g: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}costPer100g']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || costPer100g != null) {
      map['costPer100g'] = Variable<double?>(costPer100g);
    }
    return map;
  }

  IngredientsCompanion toCompanion(bool nullToAbsent) {
    return IngredientsCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      costPer100g: costPer100g == null && nullToAbsent
          ? const Value.absent()
          : Value(costPer100g),
    );
  }

  factory Ingredient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ingredient(
      name: serializer.fromJson<String?>(json['name']),
      costPer100g: serializer.fromJson<double?>(json['costPer100g']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String?>(name),
      'costPer100g': serializer.toJson<double?>(costPer100g),
    };
  }

  Ingredient copyWith({String? name, double? costPer100g}) => Ingredient(
        name: name ?? this.name,
        costPer100g: costPer100g ?? this.costPer100g,
      );
  @override
  String toString() {
    return (StringBuffer('Ingredient(')
          ..write('name: $name, ')
          ..write('costPer100g: $costPer100g')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, costPer100g);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ingredient &&
          other.name == this.name &&
          other.costPer100g == this.costPer100g);
}

class IngredientsCompanion extends UpdateCompanion<Ingredient> {
  final Value<String?> name;
  final Value<double?> costPer100g;
  const IngredientsCompanion({
    this.name = const Value.absent(),
    this.costPer100g = const Value.absent(),
  });
  IngredientsCompanion.insert({
    this.name = const Value.absent(),
    this.costPer100g = const Value.absent(),
  });
  static Insertable<Ingredient> custom({
    Expression<String?>? name,
    Expression<double?>? costPer100g,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (costPer100g != null) 'costPer100g': costPer100g,
    });
  }

  IngredientsCompanion copyWith(
      {Value<String?>? name, Value<double?>? costPer100g}) {
    return IngredientsCompanion(
      name: name ?? this.name,
      costPer100g: costPer100g ?? this.costPer100g,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (costPer100g.present) {
      map['costPer100g'] = Variable<double?>(costPer100g.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsCompanion(')
          ..write('name: $name, ')
          ..write('costPer100g: $costPer100g')
          ..write(')'))
        .toString();
  }
}

class Ingredients extends Table with TableInfo<Ingredients, Ingredient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Ingredients(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  final VerificationMeta _costPer100gMeta =
      const VerificationMeta('costPer100g');
  late final GeneratedColumn<double?> costPer100g = GeneratedColumn<double?>(
      'costPer100g', aliasedName, true,
      type: const RealType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name, costPer100g];
  @override
  String get aliasedName => _alias ?? 'ingredients';
  @override
  String get actualTableName => 'ingredients';
  @override
  VerificationContext validateIntegrity(Insertable<Ingredient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('costPer100g')) {
      context.handle(
          _costPer100gMeta,
          costPer100g.isAcceptableOrUnknown(
              data['costPer100g']!, _costPer100gMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  Ingredient map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Ingredient.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Ingredients createAlias(String alias) {
    return Ingredients(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final Users users = Users(this);
  late final Calendars calendars = Calendars(this);
  late final DateTime dateTime = DateTime(this);
  late final Ingredients ingredients = Ingredients(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, calendars, dateTime, ingredients];
}
