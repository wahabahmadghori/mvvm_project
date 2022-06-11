import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvmproject/presentation/resources/color_manager.dart';
import 'package:mvvmproject/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/model.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: Container(
        height: AppSize.s100,
        child: Column(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Container(
              color: ColorManager.primary, child: _getBottomSheetWidget()),
        ]),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
            onTap: () {
              _pageController.animateToPage(_getPrevPage(),
                  duration:
                      const Duration(microseconds: DurationConstants.d300),
                  curve: Curves.bounceInOut);
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
            onTap: () {
              _pageController.animateToPage(_getNextPage(),
                  duration:
                      const Duration(microseconds: DurationConstants.d300),
                  curve: Curves.bounceInOut);
            },
          ),
        ),
      ],
    );
  }

  Widget _getProperCircle(int index) {
    return index == _currentIndex
        ? SvgPicture.asset(ImageAssets.hollowCircleIc)
        : SvgPicture.asset(ImageAssets.solidCircleIc);
  }

  int _getPrevPage() {
    int _prevIndex = _currentIndex--;
    if (_prevIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    return _currentIndex;
  }

  int _getNextPage() {
    int _nextIndex = _currentIndex++;
    if (_nextIndex == _list.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
