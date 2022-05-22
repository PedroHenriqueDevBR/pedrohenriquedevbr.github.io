// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PortfolioStore on _PortfolioStore, Store {
  late final _$loadingAtom =
      Atom(name: '_PortfolioStore.loading', context: context);

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

  late final _$_PortfolioStoreActionController =
      ActionController(name: '_PortfolioStore', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_PortfolioStoreActionController.startAction(
        name: '_PortfolioStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_PortfolioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
