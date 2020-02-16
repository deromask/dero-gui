/*
Copyright (c) 2018-2019 Avenge Media LLC
Copyright (c) 2019 DeroMask
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
import 'dart:io';

import 'package:dero/core/config.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/util/exceptions.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

enum FourLineAddressTextType { PRIMARY60, PRIMARY, SUCCESS, SUCCESS_FULL }
enum OneLineAddressTextType { PRIMARY60, PRIMARY, SUCCESS }
enum MonkeySize { SMALLEST, SMALL, HOME_SMALL, NORMAL, LARGE, SVG }

class UIUtil {
  Widget fourLineAddressText(BuildContext context, String address,
      {FourLineAddressTextType type = FourLineAddressTextType.PRIMARY,
      String contactName}) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    if (address == null || address == "" || address.length < 90)
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: address),
      );
    try {
      String stringPartOne = address.substring(0, 10);
      String stringPartTwo = address.substring(10, 24);

      String stringPartThree = address.substring(24, 49);
      String stringPartFour = address.substring(49, 73);

      String stringPartFive = address.substring(73, address.length - 6);

      String stringPartSix = address.substring(address.length - 6);

      switch (type) {
        case FourLineAddressTextType.PRIMARY60:
          return Column(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartOne,
                      style: AppStyles.textStyleAddressPrimary60(context),
                    ),
                    TextSpan(
                      text: stringPartTwo,
                      style: AppStyles.textStyleAddressText60(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartThree,
                      style: AppStyles.textStyleAddressText60(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFour,
                      style: AppStyles.textStyleAddressText60(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFive,
                      style: AppStyles.textStyleAddressText60(context),
                    ),
                    TextSpan(
                        text: stringPartSix,
                        style: AppStyles.textStyleAddressPrimary60(context)),
                  ],
                ),
              )
            ],
          );
        case FourLineAddressTextType.PRIMARY:
          Widget contactWidget = contactName != null
              ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: contactName,
                      style: AppStyles.textStyleAddressPrimary(context)))
              : SizedBox();
          return Column(
            children: <Widget>[
//              contactWidget,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartOne,
                      style: AppStyles.textStyleAddressPrimary(context),
                    ),
                    TextSpan(
                      text: stringPartTwo,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartThree,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFour,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFive,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                    TextSpan(
                      text: stringPartSix,
                      style: AppStyles.textStyleAddressPrimary(context),
                    ),
                  ],
                ),
              )
            ],
          );
        case FourLineAddressTextType.SUCCESS:
//          Widget contactWidget = contactName != null
//              ? RichText(
//                  textAlign: TextAlign.center,
//                  text: TextSpan(
//                      text: contactName,
//                      style: AppStyles.textStyleAddressSuccess(context)))
//              : SizedBox();
          return Column(
            children: <Widget>[
//              contactWidget,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartOne,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                    TextSpan(
                      text: stringPartTwo,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartThree,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFour,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFive,
                      style: AppStyles.textStyleAddressText90(context),
                    ),
                    TextSpan(
                      text: stringPartSix,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                  ],
                ),
              )
            ],
          );
        case FourLineAddressTextType.SUCCESS_FULL:
          return Column(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartOne,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                    TextSpan(
                      text: stringPartTwo,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartThree,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFour,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  children: [
                    TextSpan(
                      text: stringPartFive,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                    TextSpan(
                      text: stringPartSix,
                      style: AppStyles.textStyleAddressSuccess(context),
                    ),
                  ],
                ),
              )
            ],
          );
        default:
          throw new UIException("Invalid threeLineAddressText Type $type");
      }
    } on Exception {
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '',
          children: [
            TextSpan(
              text: address,
              style: AppStyles.textStyleAddressPrimary60(context),
            ),
          ],
        ),
      );
    }
  }

  Widget oneLineAddressText(BuildContext context, String address,
      {OneLineAddressTextType type = OneLineAddressTextType.PRIMARY}) {
    String stringPartOne = address.substring(0, 11);
    String stringPartFive = address.substring(58, 64);
    switch (type) {
      case OneLineAddressTextType.PRIMARY60:
        return Column(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                    text: stringPartOne,
                    style: AppStyles.textStyleAddressPrimary60(context),
                  ),
                  TextSpan(
                    text: "...",
                    style: AppStyles.textStyleAddressText60(context),
                  ),
                  TextSpan(
                    text: stringPartFive,
                    style: AppStyles.textStyleAddressPrimary60(context),
                  ),
                ],
              ),
            ),
          ],
        );
      case OneLineAddressTextType.PRIMARY:
        return Column(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                    text: stringPartOne,
                    style: AppStyles.textStyleAddressPrimary(context),
                  ),
                  TextSpan(
                    text: "...",
                    style: AppStyles.textStyleAddressText90(context),
                  ),
                  TextSpan(
                    text: stringPartFive,
                    style: AppStyles.textStyleAddressPrimary(context),
                  ),
                ],
              ),
            ),
          ],
        );
      case OneLineAddressTextType.SUCCESS:
        return Column(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                    text: stringPartOne,
                    style: AppStyles.textStyleAddressSuccess(context),
                  ),
                  TextSpan(
                    text: "...",
                    style: AppStyles.textStyleAddressText90(context),
                  ),
                  TextSpan(
                    text: stringPartFive,
                    style: AppStyles.textStyleAddressSuccess(context),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        throw new UIException("Invalid oneLineAddressText Type $type");
    }
  }

  Widget threeLineSeedText(BuildContext context, String address,
      {TextStyle textStyle}) {
    textStyle = textStyle ?? AppStyles.textStyleSeed(context);
    String stringPartOne = address.substring(0, 22);
    String stringPartTwo = address.substring(22, 44);
    String stringPartThree = address.substring(44, 64);
    return Column(
      children: <Widget>[
        Text(
          stringPartOne,
          style: textStyle,
        ),
        Text(
          stringPartTwo,
          style: textStyle,
        ),
        Text(
          stringPartThree,
          style: textStyle,
        ),
      ],
    );
  }

  Widget oneLineTrimmedAddressText(BuildContext context, String address) {
    if (address == null || address == "" || address.length < 90)
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: address),
      );
//    print("ui_util:address:" + address);
    String stringPartOne = address.substring(0, 8);
    String stringPartTwo = address.substring(8, 13);
    String stringPartThree =
        address.substring(address.length - 12, address.length - 6);
    String stringPartFour = address.substring(address.length - 6);

//    print("ui_util:partone:"+stringPartOne);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '',
        children: [
          TextSpan(
            text: stringPartOne,
            style: AppStyles.textStyleAddressPrimary60(context),
          ),
          TextSpan(
            text: stringPartTwo,
            style: AppStyles.textStyleAddressText60(context),
          ),
          TextSpan(
            text: "...",
            style: AppStyles.textStyleAddressText60(context),
          ),
          TextSpan(
            text: stringPartThree,
            style: AppStyles.textStyleAddressText60(context),
          ),
          TextSpan(
            text: stringPartFour,
            style: AppStyles.textStyleAddressPrimary60(context),
          ),
        ],
      ),
    );
  }

  static String middleTrimmedText(String text, {int start = 6, int subend}) {
    if (subend != null) {
      return text.substring(0, start) +
          "..." +
          text.substring(text.length - subend);
    }
    return text.substring(0, 6) + "..." + text.substring(text.length - 8);
  }

//  static String getWalletFilename(String filepath) {
//    String filename = filepath.split("/").last;
//    List<String> splitted = filename.split(".");
//    if (splitted.length >= 2) {
//      splitted.removeLast();
//      return splitted.join(".");
//    } else {
//      return filename;
//    }
//  }

  static String getWalletFilename(String filepath) {
    File file = new File(filepath);
    String filename = basename(file.path);

    List<String> splitted = filename.split(".");
    if (splitted.length >= 2) {
      splitted.removeLast();
      return splitted.join(".");
    } else {
      return filename;
    }
  }

  static String trimBalance(String text) {
    var parts = text.split(".");
    if (parts.length != 2) return text;
    if (parts[1].length <= 2) return text;

    String trimLastZero(String text) {
      if (text[text.length - 1] == '0')
        return text.substring(0, text.length - 1);
      else
        return text;
    }

    var trimmed = trimLastZero(parts[1]);
    while (
        trimmed.length >= 2 && trimmed.length > trimLastZero(trimmed).length) {
      trimmed = trimLastZero(trimmed);
    }

    return parts[0] + "." + trimmed;
  }

  static double money12(Int64 m) {
    return m.toDouble() / 1000000000000;
  }

//  static String formatMoney12(double m) {
//    return m.toStringAsFixed(12);
//  }

  static String formatMoney12(Int64 m) {
    double amount = money12(m);
    return amount.toStringAsFixed(12);
  }
}
