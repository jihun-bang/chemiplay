// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'game.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GameModelCollectionReference
    implements
        GameModelQuery,
        FirestoreCollectionReference<GameModel, GameModelQuerySnapshot> {
  factory GameModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GameModelCollectionReference;

  static GameModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return GameModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    GameModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<GameModel> get reference;

  @override
  GameModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GameModelDocumentReference> add(GameModel value);
}

class _$GameModelCollectionReference extends _$GameModelQuery
    implements GameModelCollectionReference {
  factory _$GameModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GameModelCollectionReference._(
      firestore.collection('games').withConverter(
            fromFirestore: GameModelCollectionReference.fromFirestore,
            toFirestore: GameModelCollectionReference.toFirestore,
          ),
    );
  }

  _$GameModelCollectionReference._(
    CollectionReference<GameModel> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<GameModel> get reference =>
      super.reference as CollectionReference<GameModel>;

  @override
  GameModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return GameModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GameModelDocumentReference> add(GameModel value) {
    return reference.add(value).then((ref) => GameModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GameModelDocumentReference
    extends FirestoreDocumentReference<GameModel, GameModelDocumentSnapshot> {
  factory GameModelDocumentReference(DocumentReference<GameModel> reference) =
      _$GameModelDocumentReference;

  DocumentReference<GameModel> get reference;

  /// A reference to the [GameModelCollectionReference] containing this document.
  GameModelCollectionReference get parent {
    return _$GameModelCollectionReference(reference.firestore);
  }

  @override
  Stream<GameModelDocumentSnapshot> snapshots();

  @override
  Future<GameModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String image,
    FieldValue imageFieldValue,
    List<String> position,
    FieldValue positionFieldValue,
    List<String> rank,
    FieldValue rankFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String image,
    FieldValue imageFieldValue,
    List<String> position,
    FieldValue positionFieldValue,
    List<String> rank,
    FieldValue rankFieldValue,
  });
}

class _$GameModelDocumentReference
    extends FirestoreDocumentReference<GameModel, GameModelDocumentSnapshot>
    implements GameModelDocumentReference {
  _$GameModelDocumentReference(this.reference);

  @override
  final DocumentReference<GameModel> reference;

  /// A reference to the [GameModelCollectionReference] containing this document.
  GameModelCollectionReference get parent {
    return _$GameModelCollectionReference(reference.firestore);
  }

  @override
  Stream<GameModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map(GameModelDocumentSnapshot._);
  }

  @override
  Future<GameModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GameModelDocumentSnapshot._);
  }

  @override
  Future<GameModelDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(GameModelDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? image = _sentinel,
    FieldValue? imageFieldValue,
    Object? position = _sentinel,
    FieldValue? positionFieldValue,
    Object? rank = _sentinel,
    FieldValue? rankFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      image == _sentinel || imageFieldValue == null,
      "Cannot specify both image and imageFieldValue",
    );
    assert(
      position == _sentinel || positionFieldValue == null,
      "Cannot specify both position and positionFieldValue",
    );
    assert(
      rank == _sentinel || rankFieldValue == null,
      "Cannot specify both rank and rankFieldValue",
    );
    final json = {
      if (name != _sentinel) _$GameModelFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$GameModelFieldMap['name']!: nameFieldValue,
      if (image != _sentinel) _$GameModelFieldMap['image']!: image as String,
      if (imageFieldValue != null)
        _$GameModelFieldMap['image']!: imageFieldValue,
      if (position != _sentinel)
        _$GameModelFieldMap['position']!: position as List<String>,
      if (positionFieldValue != null)
        _$GameModelFieldMap['position']!: positionFieldValue,
      if (rank != _sentinel) _$GameModelFieldMap['rank']!: rank as List<String>,
      if (rankFieldValue != null) _$GameModelFieldMap['rank']!: rankFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? image = _sentinel,
    FieldValue? imageFieldValue,
    Object? position = _sentinel,
    FieldValue? positionFieldValue,
    Object? rank = _sentinel,
    FieldValue? rankFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      image == _sentinel || imageFieldValue == null,
      "Cannot specify both image and imageFieldValue",
    );
    assert(
      position == _sentinel || positionFieldValue == null,
      "Cannot specify both position and positionFieldValue",
    );
    assert(
      rank == _sentinel || rankFieldValue == null,
      "Cannot specify both rank and rankFieldValue",
    );
    final json = {
      if (name != _sentinel) _$GameModelFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$GameModelFieldMap['name']!: nameFieldValue,
      if (image != _sentinel) _$GameModelFieldMap['image']!: image as String,
      if (imageFieldValue != null)
        _$GameModelFieldMap['image']!: imageFieldValue,
      if (position != _sentinel)
        _$GameModelFieldMap['position']!: position as List<String>,
      if (positionFieldValue != null)
        _$GameModelFieldMap['position']!: positionFieldValue,
      if (rank != _sentinel) _$GameModelFieldMap['rank']!: rank as List<String>,
      if (rankFieldValue != null) _$GameModelFieldMap['rank']!: rankFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is GameModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class GameModelQuery
    implements QueryReference<GameModel, GameModelQuerySnapshot> {
  @override
  GameModelQuery limit(int limit);

  @override
  GameModelQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  GameModelQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  GameModelQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  GameModelQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameModelQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameModelQuery whereImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameModelQuery wherePosition({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  GameModelQuery whereRank({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });

  GameModelQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  });

  GameModelQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  });

  GameModelQuery orderByImage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  });

  GameModelQuery orderByPosition({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  });

  GameModelQuery orderByRank({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  });
}

class _$GameModelQuery extends QueryReference<GameModel, GameModelQuerySnapshot>
    implements GameModelQuery {
  _$GameModelQuery(
    this._collection, {
    required Query<GameModel> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<GameModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(GameModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<GameModelQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(GameModelQuerySnapshot._fromQuerySnapshot);
  }

  @override
  GameModelQuery limit(int limit) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GameModelQuery limitToLast(int limit) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameModelQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GameModelFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery whereImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GameModelFieldMap['image']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery wherePosition({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GameModelFieldMap['position']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery whereRank({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GameModelFieldMap['rank']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameModelQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameModelQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GameModelFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameModelQuery orderByImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GameModelFieldMap['image']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameModelQuery orderByPosition({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$GameModelFieldMap['position']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameModelQuery orderByRank({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameModelDocumentSnapshot? startAtDocument,
    GameModelDocumentSnapshot? endAtDocument,
    GameModelDocumentSnapshot? endBeforeDocument,
    GameModelDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GameModelFieldMap['rank']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameModelQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GameModelDocumentSnapshot extends FirestoreDocumentSnapshot<GameModel> {
  GameModelDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<GameModel> snapshot;

  @override
  GameModelDocumentReference get reference {
    return GameModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final GameModel? data;
}

class GameModelQuerySnapshot
    extends FirestoreQuerySnapshot<GameModel, GameModelQueryDocumentSnapshot> {
  GameModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory GameModelQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<GameModel> snapshot,
  ) {
    final docs = snapshot.docs.map(GameModelQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        GameModelDocumentSnapshot._,
      );
    }).toList();

    return GameModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<GameModelDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    GameModelDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<GameModelDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<GameModel> snapshot;

  @override
  final List<GameModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GameModelDocumentSnapshot>> docChanges;
}

class GameModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<GameModel>
    implements GameModelDocumentSnapshot {
  GameModelQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<GameModel> snapshot;

  @override
  final GameModel data;

  @override
  GameModelDocumentReference get reference {
    return GameModelDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      name: json['name'] as String,
      image: json['image'] as String,
      position:
          (json['position'] as List<dynamic>).map((e) => e as String).toList(),
      rank: (json['rank'] as List<dynamic>).map((e) => e as String).toList(),
    );

const _$GameModelFieldMap = <String, String>{
  'name': 'name',
  'image': 'image',
  'position': 'position',
  'rank': 'rank',
};

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'position': instance.position,
      'rank': instance.rank,
    };
