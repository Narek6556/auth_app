// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  Computed<bool>? _$isLoginSelectedComputed;

  @override
  bool get isLoginSelected =>
      (_$isLoginSelectedComputed ??= Computed<bool>(() => super.isLoginSelected,
              name: 'AuthStoreBase.isLoginSelected'))
          .value;

  late final _$loadingAtom =
      Atom(name: 'AuthStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'AuthStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$toastMessageAtom =
      Atom(name: 'AuthStoreBase.toastMessage', context: context);

  @override
  String get toastMessage {
    _$toastMessageAtom.reportRead();
    return super.toastMessage;
  }

  @override
  set toastMessage(String value) {
    _$toastMessageAtom.reportWrite(value, super.toastMessage, () {
      super.toastMessage = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'AuthStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$shouldShowToastAtom =
      Atom(name: 'AuthStoreBase.shouldShowToast', context: context);

  @override
  bool? get shouldShowToast {
    _$shouldShowToastAtom.reportRead();
    return super.shouldShowToast;
  }

  @override
  set shouldShowToast(bool? value) {
    _$shouldShowToastAtom.reportWrite(value, super.shouldShowToast, () {
      super.shouldShowToast = value;
    });
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  void changeSelectedIndex(int index) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(index);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showToast({bool? isSucceed = false, String message = ''}) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.showToast');
    try {
      return super.showToast(isSucceed: isSucceed, message: message);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool newLoading) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.setLoading');
    try {
      return super.setLoading(newLoading);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String message) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.setErrorMessage');
    try {
      return super.setErrorMessage(message);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorMessage: ${errorMessage},
toastMessage: ${toastMessage},
selectedIndex: ${selectedIndex},
shouldShowToast: ${shouldShowToast},
isLoginSelected: ${isLoginSelected}
    ''';
  }
}
