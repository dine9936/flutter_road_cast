// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_databse.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final String name;
  final String username;
  Order({@required this.name, @required this.username});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Order(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
    };
  }

  Order copyWith({String name, String username}) => Order(
        name: name ?? this.name,
        username: username ?? this.username,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('name: $name, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode, username.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.name == this.name &&
          other.username == this.username);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> name;
  final Value<String> username;
  const OrdersCompanion({
    this.name = const Value.absent(),
    this.username = const Value.absent(),
  });
  OrdersCompanion.insert({
    @required String name,
    @required String username,
  })  : name = Value(name),
        username = Value(username);
  static Insertable<Order> custom({
    Expression<String> name,
    Expression<String> username,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (username != null) 'username': username,
    });
  }

  OrdersCompanion copyWith({Value<String> name, Value<String> username}) {
    return OrdersCompanion(
      name: name ?? this.name,
      username: username ?? this.username,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('name: $name, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedColumn<String> _name;
  @override
  GeneratedColumn<String> get name =>
      _name ??= GeneratedColumn<String>('name', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedColumn<String> _username;
  @override
  GeneratedColumn<String> get username =>
      _username ??= GeneratedColumn<String>('username', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, username];
  @override
  String get aliasedName => _alias ?? 'orders';
  @override
  String get actualTableName => 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    return Order.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $OrdersTable _orders;
  $OrdersTable get orders => _orders ??= $OrdersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}
