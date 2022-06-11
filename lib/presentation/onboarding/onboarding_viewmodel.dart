import 'dart:async';

import 'package:mvvmproject/domain/model.dart';
import 'package:mvvmproject/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goNext() {}

  @override
  void goPrevious() {}

  @override
  void onPageChanged(int index) {}
}

class SliderViewObject {
  SliderObject _sliderObject;
  int numOfSliders;
  int currentIndex;
  SliderViewObject(this._sliderObject, this.numOfSliders, this.currentIndex);
}

abstract class OnBoardingViewModelInput {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outPutSliderViewObject;
}
