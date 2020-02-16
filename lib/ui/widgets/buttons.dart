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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:dero/ui/util/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

enum AppButtonType {
  PRIMARY,
  PRIMARY_OUTLINE,
  SUCCESS,
  SUCCESS_OUTLINE,
  TEXT_OUTLINE
}

class AppButton {
  // Primary button builder
  static Widget buildAppButton(BuildContext context, AppButtonType type,
      String buttonText, List<double> dimens,
      {Function onPressed, bool disabled = false}) {
    double defaultScreenWidth = 500.0;
    double defaultScreenHeight = 890.0;
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    switch (type) {
      case AppButtonType.PRIMARY:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [Provider.of<AppTheme>(context).boxShadowButton],
            ),
            height: ScreenUtil().setWidth(55),
            margin: EdgeInsetsDirectional.fromSTEB(
                dimens[0], dimens[1], dimens[2], dimens[3]),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              color: disabled
                  ? Provider.of<AppTheme>(context).primary60
                  : Provider.of<AppTheme>(context).primary,
              child: AutoSizeText(buttonText,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyleButtonPrimary(context),
                  maxLines: 1,
                  stepGranularity: 0.5),
              onPressed: () {
                if (onPressed != null && !disabled) {
                  onPressed();
                }
                return;
              },
              highlightColor: Provider.of<AppTheme>(context).background40,
              splashColor: Provider.of<AppTheme>(context).background40,
            ),
          ),
        );
      case AppButtonType.PRIMARY_OUTLINE:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Provider.of<AppTheme>(context).backgroundDark,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [Provider.of<AppTheme>(context).boxShadowButton],
            ),
            height: ScreenUtil().setWidth(55),
            margin: EdgeInsetsDirectional.fromSTEB(
                dimens[0], dimens[1], dimens[2], dimens[3]),
            child: OutlineButton(
              color: Provider.of<AppTheme>(context).backgroundDark,
              textColor: disabled
                  ? Provider.of<AppTheme>(context).primary60
                  : Provider.of<AppTheme>(context).primary,
              borderSide: BorderSide(
                  color: disabled
                      ? Provider.of<AppTheme>(context).primary60
                      : Provider.of<AppTheme>(context).primary,
                  width: 2.0),
              highlightedBorderColor: disabled
                  ? Provider.of<AppTheme>(context).primary60
                  : Provider.of<AppTheme>(context).primary,
              splashColor: Provider.of<AppTheme>(context).primary30,
              highlightColor: Provider.of<AppTheme>(context).primary15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: AutoSizeText(
                buttonText,
                textAlign: TextAlign.center,
                style: disabled
                    ? AppStyles.textStyleButtonPrimaryOutlineDisabled(context)
                    : AppStyles.textStyleButtonPrimaryOutline(context),
                maxLines: 1,
                stepGranularity: 0.5,
              ),
              onPressed: () {
                if (onPressed != null && !disabled) {
                  onPressed();
                }
                return;
              },
            ),
          ),
        );
      case AppButtonType.SUCCESS:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [Provider.of<AppTheme>(context).boxShadowButton],
            ),
            height: ScreenUtil().setWidth(55),
            margin: EdgeInsetsDirectional.fromSTEB(
                dimens[0], dimens[1], dimens[2], dimens[3]),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              color: Provider.of<AppTheme>(context).success,
              child: AutoSizeText(
                buttonText,
                textAlign: TextAlign.center,
                style: AppStyles.textStyleButtonPrimaryGreen(context),
                maxLines: 1,
                stepGranularity: 0.5,
              ),
              onPressed: () {
                if (onPressed != null && !disabled) {
                  onPressed();
                }
                return;
              },
              highlightColor: Provider.of<AppTheme>(context).success30,
              splashColor: Provider.of<AppTheme>(context).successDark,
            ),
          ),
        );
      case AppButtonType.SUCCESS_OUTLINE:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Provider.of<AppTheme>(context).backgroundDark,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [Provider.of<AppTheme>(context).boxShadowButton],
            ),
            height: ScreenUtil().setWidth(55),
            margin: EdgeInsetsDirectional.fromSTEB(
                dimens[0], dimens[1], dimens[2], dimens[3]),
            child: OutlineButton(
              color: Provider.of<AppTheme>(context).backgroundDark,
              textColor: Provider.of<AppTheme>(context).success,
              borderSide: BorderSide(
                  color: Provider.of<AppTheme>(context).success, width: 2.0),
              highlightedBorderColor: Provider.of<AppTheme>(context).success,
              splashColor: Provider.of<AppTheme>(context).success30,
              highlightColor: Provider.of<AppTheme>(context).success15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: AutoSizeText(
                buttonText,
                textAlign: TextAlign.center,
                style: AppStyles.textStyleButtonSuccessOutline(context),
                maxLines: 1,
                stepGranularity: 0.5,
              ),
              onPressed: () {
                if (onPressed != null) {
                  onPressed();
                }
                return;
              },
            ),
          ),
        );
      case AppButtonType.TEXT_OUTLINE:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Provider.of<AppTheme>(context).backgroundDark,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [Provider.of<AppTheme>(context).boxShadowButton],
            ),
            height: ScreenUtil().setWidth(55),
            margin: EdgeInsetsDirectional.fromSTEB(
                dimens[0], dimens[1], dimens[2], dimens[3]),
            child: OutlineButton(
              color: Provider.of<AppTheme>(context).backgroundDark,
              textColor: Provider.of<AppTheme>(context).text,
              borderSide: BorderSide(
                  color: Provider.of<AppTheme>(context).text, width: 2.0),
              highlightedBorderColor: Provider.of<AppTheme>(context).text,
              splashColor: Provider.of<AppTheme>(context).text30,
              highlightColor: Provider.of<AppTheme>(context).text15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: AutoSizeText(
                buttonText,
                textAlign: TextAlign.center,
                style: AppStyles.textStyleButtonTextOutline(context),
                maxLines: 1,
                stepGranularity: 0.5,
              ),
              onPressed: () {
                if (onPressed != null) {
                  onPressed();
                }
                return;
              },
            ),
          ),
        );
      default:
        throw new UIException("Invalid Button Type $type");
    }
  } //
}
