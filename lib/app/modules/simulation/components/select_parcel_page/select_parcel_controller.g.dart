// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_parcel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectParceleController on _SelectParceleControllerBase, Store {
  final _$parcelValueAtom =
      Atom(name: '_SelectParceleControllerBase.parcelValue');

  @override
  double get parcelValue {
    _$parcelValueAtom.reportRead();
    return super.parcelValue;
  }

  @override
  set parcelValue(double value) {
    _$parcelValueAtom.reportWrite(value, super.parcelValue, () {
      super.parcelValue = value;
    });
  }

  final _$percentageValueAtom =
      Atom(name: '_SelectParceleControllerBase.percentageValue');

  @override
  double get percentageValue {
    _$percentageValueAtom.reportRead();
    return super.percentageValue;
  }

  @override
  set percentageValue(double value) {
    _$percentageValueAtom.reportWrite(value, super.percentageValue, () {
      super.percentageValue = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SelectParceleControllerBase.loading');

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

  @override
  String toString() {
    return '''
parcelValue: ${parcelValue},
percentageValue: ${percentageValue},
loading: ${loading}
    ''';
  }
}
