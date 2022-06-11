import 'dart:async';

import 'package:mvvmproject/domain/model.dart';
import 'package:mvvmproject/presentation/base/baseviewmodel.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int _currentIndex = 0;
  late final List<SliderObject> _list;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext() {
    int _nextIndex = _currentIndex++;
    if (_nextIndex == _list.length) {
      _currentIndex = 0;
    }
    _postDataToView();
  }

  @override
  void goPrevious() {
    int _prevIndex = _currentIndex--;
    if (_prevIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outPutSliderViewObject =>
      _streamController.stream.map((_sliderViewObject) => _sliderViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
      ];

  _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
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
