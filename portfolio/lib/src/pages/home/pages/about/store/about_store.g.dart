// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AboutStore on _AboutStore, Store {
  late final _$experienceItemSelectedAtom =
      Atom(name: '_AboutStore.experienceItemSelected', context: context);

  @override
  int get experienceItemSelected {
    _$experienceItemSelectedAtom.reportRead();
    return super.experienceItemSelected;
  }

  @override
  set experienceItemSelected(int value) {
    _$experienceItemSelectedAtom
        .reportWrite(value, super.experienceItemSelected, () {
      super.experienceItemSelected = value;
    });
  }

  late final _$tecnologyItemSelectedAtom =
      Atom(name: '_AboutStore.tecnologyItemSelected', context: context);

  @override
  int get tecnologyItemSelected {
    _$tecnologyItemSelectedAtom.reportRead();
    return super.tecnologyItemSelected;
  }

  @override
  set tecnologyItemSelected(int value) {
    _$tecnologyItemSelectedAtom.reportWrite(value, super.tecnologyItemSelected,
        () {
      super.tecnologyItemSelected = value;
    });
  }

  late final _$_AboutStoreActionController =
      ActionController(name: '_AboutStore', context: context);

  @override
  void setExperienceItemSelected(int value) {
    final _$actionInfo = _$_AboutStoreActionController.startAction(
        name: '_AboutStore.setExperienceItemSelected');
    try {
      return super.setExperienceItemSelected(value);
    } finally {
      _$_AboutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTecnologyItemSelected(int value) {
    final _$actionInfo = _$_AboutStoreActionController.startAction(
        name: '_AboutStore.setTecnologyItemSelected');
    try {
      return super.setTecnologyItemSelected(value);
    } finally {
      _$_AboutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
experienceItemSelected: ${experienceItemSelected},
tecnologyItemSelected: ${tecnologyItemSelected}
    ''';
  }
}
