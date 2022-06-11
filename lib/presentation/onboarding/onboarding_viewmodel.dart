import 'package:mvvmproject/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
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

abstract class OnBoardingViewModelInput {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);
}

abstract class OnBoardingViewModelOutput {}
