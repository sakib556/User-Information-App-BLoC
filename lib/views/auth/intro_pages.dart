import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test_rest_api_flutter/views/style/app_colors.dart';

final List<PageViewModel> introPages = [
  PageViewModel(
    titleWidget: Column(
      children: <Widget>[
        const Text(
          'FREE GIFT',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 3,
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    ),
    body:
        "Free gifts with purchase. Offer free gifts like a gift wrap, gift card, or any free product.",
    image: Center(child: SvgPicture.asset("assets/icons/gift.svg")),
    decoration: const PageDecoration(
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        bodyPadding: EdgeInsets.only(left: 20, right: 20),
        imagePadding: EdgeInsets.all(20)),
  ),
  PageViewModel(
    titleWidget: Column(
      children: <Widget>[
        const Text(
          'PAYMENT INTEGRATION',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 3,
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    ),
    body:
        "A payment gateway as a merchant service that processes credit card payments for ecommerce sites and traditional brick and mortar stores.",
    image: Center(
        child: SizedBox(
      width: 450.0,
      child: SvgPicture.asset("assets/icons/payment.svg"),
    )),
    decoration: const PageDecoration(
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        bodyPadding: EdgeInsets.only(left: 20, right: 20),
        imagePadding: EdgeInsets.all(20)),
  ),
  PageViewModel(
    titleWidget: Column(
      children: <Widget>[
        const Text(
          'CALL CENTER',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 3,
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    ),
    body:
        "Call center gives a small business a big business feel. 24-hour sales, order entry, payment processing, billing inquiries, and more.",
    image: Center(
        child: SizedBox(
      width: 450.0,
      child: SvgPicture.asset("assets/icons/call.svg"),
    )),
    decoration: const PageDecoration(
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        bodyPadding: EdgeInsets.only(left: 20, right: 20),
        imagePadding: EdgeInsets.all(20)),
  ),
];
