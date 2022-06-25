// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acquisition_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AcquisitionController on _AcquisitionControllerBase, Store {
  final _$stepAtom = Atom(name: '_AcquisitionControllerBase.step');

  @override
  int get step {
    _$stepAtom.reportRead();
    return super.step;
  }

  @override
  set step(int value) {
    _$stepAtom.reportWrite(value, super.step, () {
      super.step = value;
    });
  }

  final _$_AcquisitionControllerBaseActionController =
      ActionController(name: '_AcquisitionControllerBase');

  @override
  dynamic changeStep(int value) {
    final _$actionInfo = _$_AcquisitionControllerBaseActionController
        .startAction(name: '_AcquisitionControllerBase.changeStep');
    try {
      return super.changeStep(value);
    } finally {
      _$_AcquisitionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
step: ${step}
    ''';
  }
}
