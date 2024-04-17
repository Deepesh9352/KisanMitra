// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FirebaseStruct extends FFFirebaseStruct {
  FirebaseStruct({
    String? email,
    String? password,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _password = password,
        super(firestoreUtilData);

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  static FirebaseStruct fromMap(Map<String, dynamic> data) => FirebaseStruct(
        email: data['Email'] as String?,
        password: data['password'] as String?,
      );

  static FirebaseStruct? maybeFromMap(dynamic data) =>
      data is Map ? FirebaseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Email': _email,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static FirebaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      FirebaseStruct(
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FirebaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FirebaseStruct &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([email, password]);
}

FirebaseStruct createFirebaseStruct({
  String? email,
  String? password,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FirebaseStruct(
      email: email,
      password: password,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FirebaseStruct? updateFirebaseStruct(
  FirebaseStruct? firebase, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    firebase
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFirebaseStructData(
  Map<String, dynamic> firestoreData,
  FirebaseStruct? firebase,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (firebase == null) {
    return;
  }
  if (firebase.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && firebase.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final firebaseData = getFirebaseFirestoreData(firebase, forFieldValue);
  final nestedData = firebaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = firebase.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFirebaseFirestoreData(
  FirebaseStruct? firebase, [
  bool forFieldValue = false,
]) {
  if (firebase == null) {
    return {};
  }
  final firestoreData = mapToFirestore(firebase.toMap());

  // Add any Firestore field values
  firebase.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFirebaseListFirestoreData(
  List<FirebaseStruct>? firebases,
) =>
    firebases?.map((e) => getFirebaseFirestoreData(e, true)).toList() ?? [];
