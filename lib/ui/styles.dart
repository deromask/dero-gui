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
import 'package:dero/core/config.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppStyles {
  // Text style for paragraph text.
  static TextStyle textStyleParagraph(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      fontWeight: FontWeight.w200,
      color: Provider.of<AppTheme>(context).text,
    );
  }

  // Text style for paragraph text with primary color.
  static TextStyle textStyleParagraphPrimary(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.medium),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).primary);
  }

  // Text style for paragraph text with primary color.
  static TextStyle textStyleParagraphSuccess(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.medium),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).success);
  }

  // For snackbar/Toast text
  static TextStyle textStyleSnackbar(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.small),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).background);
  }

  // Text style for primary button
  static TextStyle textStyleButtonPrimary(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).background);
  }

  // Green primary button
  static TextStyle textStyleButtonPrimaryGreen(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).successDark);
  }

  // Text style for outline button
  static TextStyle textStyleButtonPrimaryOutline(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).primary);
  }

  static TextStyle textStyleButtonPrimaryOutlineDisabled(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).primary60);
  }

  // Text style for success outline button
  static TextStyle textStyleButtonSuccessOutline(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).success);
  }

  // Text style for text outline button
  static TextStyle textStyleButtonTextOutline(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w700,
        color: Provider.of<AppTheme>(context).text);
  }

  // General address/seed styles
  static TextStyle textStyleAddressPrimary60(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      color: Provider.of<AppTheme>(context).primary60,
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      height: 1.2,
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
    );
  }

  static TextStyle textStyleAddressPrimary(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      color: Provider.of<AppTheme>(context).primary,
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      height: 1.2,
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
    );
  }

  static TextStyle textStyleAddressSuccess(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      color: Provider.of<AppTheme>(context).success,
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      height: 1.2,
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
    );
  }

  static TextStyle textStyleAddressText60(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      color: Provider.of<AppTheme>(context).text60,
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      height: 1.2,
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
    );
  }

  static TextStyle textStyleAddressText90(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      color: Provider.of<AppTheme>(context).text,
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      height: 1.2,
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
    );
  }

  // Text style for alternate currencies on home page
  static TextStyle textStyleCurrencyAlt(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.small),
        fontWeight: FontWeight.w600,
        color: Provider.of<AppTheme>(context).text60);
  }

  static TextStyle textStyleCurrencyAltHidden(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.small),
        fontWeight: FontWeight.w600,
        color: Colors.transparent);
  }

  // Text style for primary currency on home page
  static TextStyle textStyleCurrency(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w900,
        color: Provider.of<AppTheme>(context).primary);
  }

  // Text style for primary currency on home page
  static TextStyle textStyleCurrencyDisabled(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes._large),
        fontWeight: FontWeight.w900,
        color: Provider.of<AppTheme>(context).text60);
  }

  /* Transaction cards */
  // Text style for transaction card "Received"/"Sent" text
  static TextStyle textStyleTransactionType(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.small),
        fontWeight: FontWeight.w600,
        color: Provider.of<AppTheme>(context).text);
  }

  // Amount
  static TextStyle textStyleTransactionAmount(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        color: Provider.of<AppTheme>(context).primary60,
        fontSize: ScreenUtil().setSp(AppFontSizes.smallest),
        fontWeight: FontWeight.w600);
  }

  // Unit (e.g. BAN)
  static TextStyle textStyleTransactionUnit(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      color: Provider.of<AppTheme>(context).primary60,
      fontSize: ScreenUtil().setSp(AppFontSizes.smallest),
      fontWeight: FontWeight.w100,
    );
  }

  // Address
  static TextStyle textStyleTransactionAddress(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.smallest),
      fontFamily: 'OverpassMono',
      fontWeight: FontWeight.w100,
      color: Provider.of<AppTheme>(context).text60,
    );
  }

  // Transaction Welcome
  static TextStyle textStyleTransactionWelcome(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.small),
      fontWeight: FontWeight.w200,
      color: Provider.of<AppTheme>(context).text,
      fontFamily: 'NunitoSans',
    );
  }

  // Transaction Welcome Text
  static TextStyle textStyleTransactionWelcomePrimary(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.small),
      fontWeight: FontWeight.w200,
      color: Provider.of<AppTheme>(context).primary,
      fontFamily: 'NunitoSans',
    );
  }

  // Version info in settings
  static TextStyle textStyleVersion(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.small),
        fontWeight: FontWeight.w100,
        color: Provider.of<AppTheme>(context).text60);
  }

  static TextStyle textStyleVersionUnderline(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
        fontFamily: "NunitoSans",
        fontSize: ScreenUtil().setSp(AppFontSizes.small),
        fontWeight: FontWeight.w100,
        color: Provider.of<AppTheme>(context).text60,
        decoration: TextDecoration.underline);
  }

  // Text style for alert dialog header
  static TextStyle textStyleDialogHeader(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes._large),
      fontWeight: FontWeight.w700,
      color: Provider.of<AppTheme>(context).primary,
    );
  }

  // Text style for dialog options
  static TextStyle textStyleDialogOptions(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      fontWeight: FontWeight.w600,
      color: Provider.of<AppTheme>(context).text,
    );
  }

  // Text style for dialog button text
  static TextStyle textStyleDialogButtonText(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.smallest),
      fontWeight: FontWeight.w600,
      color: Provider.of<AppTheme>(context).primary,
    );
  }

  // Text style for seed text
  static TextStyle textStyleSeed(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.small),
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
      color: Provider.of<AppTheme>(context).primary,
      height: 1.3,
      letterSpacing: 1,
    );
  }

  static TextStyle textStyleSeedGray(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.small),
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
      color: Provider.of<AppTheme>(context).text60,
      height: 1.3,
      letterSpacing: 1,
    );
  }

  static TextStyle textStyleSeedGreen(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.small),
      fontWeight: FontWeight.w100,
      fontFamily: 'OverpassMono',
      color: Provider.of<AppTheme>(context).success,
      height: 1.3,
      letterSpacing: 1,
    );
  }

  // Text style for general headers like sheet headers
  static TextStyle textStyleHeader(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.large(context)),
      fontWeight: FontWeight.w700,
      color: Provider.of<AppTheme>(context).text,
    );
  }

  // Text style for settings headers
  static TextStyle textStyleSettingsHeader(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes._largest),
      fontWeight: FontWeight.w700,
      color: Provider.of<AppTheme>(context).text,
    );
  }

  // Text style for primary color header
  static TextStyle textStyleHeaderColored(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes._largest),
      fontWeight: FontWeight.w700,
      color: Provider.of<AppTheme>(context).primary,
    );
  }

  // Text style for primary color header
  static TextStyle textStyleHeader2Colored(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.larger),
      fontWeight: FontWeight.w700,
      color: Provider.of<AppTheme>(context).primary,
    );
  }

  static TextStyle textStylePinScreenHeaderColored(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes._large),
      fontWeight: FontWeight.w700,
      color: Provider.of<AppTheme>(context).primary,
    );
  }

  // Text style for setting item header
  static TextStyle textStyleSettingItemHeader(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      fontWeight: FontWeight.w600,
      color: Provider.of<AppTheme>(context).text,
    );
  }

  static TextStyle textStyleSettingItemHeader60(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      fontWeight: FontWeight.w600,
      color: Provider.of<AppTheme>(context).text60,
    );
  }

  static TextStyle textStyleSettingItemHeader45(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.medium),
      fontWeight: FontWeight.w600,
      color: Provider.of<AppTheme>(context).text45,
    );
  }

  // Text style for setting item subheader
  static TextStyle textStyleSettingItemSubheader(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.smallest),
      fontWeight: FontWeight.w100,
      color: Provider.of<AppTheme>(context).text60,
    );
  }

  static TextStyle textStyleSettingItemSubheader30(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontFamily: "NunitoSans",
      fontSize: ScreenUtil().setSp(AppFontSizes.smallest),
      fontWeight: FontWeight.w100,
      color: Provider.of<AppTheme>(context).text30,
    );
  }

  // Text style for lock screen error
  static TextStyle textStyleErrorMedium(BuildContext context) {
    ScreenUtil.init(context,
        width: BASE_WIDTH, height: BASE_HEIGHT, allowFontScaling: true);

    return TextStyle(
      fontSize: ScreenUtil().setSp(AppFontSizes.small),
      color: Provider.of<AppTheme>(context).primary,
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w600,
    );
  }
}

class AppFontSizes {
  static const smallest = 12.0;
  static const small = 14.0;
  static const medium = 17.0;
  static const _large = 21.0;
  static const larger = 25.0;
  static const _largest = 28.0;
  static const largestc = 28.0;
  static const _sslarge = 19.0;
  static const _sslargest = 23.0;

  static double largest(context) {
    if (smallScreen(context)) {
      return _sslargest;
    }
    return _largest;
  }

  static double large(context) {
    if (smallScreen(context)) {
      return _sslarge;
    }
    return _large;
  }
}

bool smallScreen(BuildContext context) {
  if (MediaQuery.of(context).size.height < 667)
    return true;
  else
    return false;
}
