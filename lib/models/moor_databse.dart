import 'package:moor_flutter/moor_flutter.dart';
part 'moor_databse.g.dart';

class Orders extends Table {
  TextColumn get name => text()();
  IntColumn get id => integer().autoIncrement().call();
  TextColumn get username => text()();



}


@UseMoor(tables: [Orders])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(
      path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;
  Future<List<Order>> getAllOrder() => select(orders).get();
  Stream<List<Order>> watchAllOrder() => select(orders).watch();
  Future insertNewOrder(Order order) => into(orders).insert(order);
  Future deleteOrder(Order order) => delete(orders).delete(order);











}