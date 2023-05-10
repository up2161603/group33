import 'package:drift/drift.dart';
import 'package:drift/web.dart';
part 'database.g.dart';

enum MealOfDay {
  breakfast,
  lunch,
  dinner
}

Set<String> dietaryRestrictions = {
  'vegan',
  'vegetarian',
  'containsNuts',
  'containsDairy',
  'containsGluten' };

@DriftDatabase(
  include: {'tables.drift'},
)

class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

WebDatabase _openConnection() {
  return WebDatabase('db');
}