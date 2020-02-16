import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/ui/styles.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

class PasswordFieldView extends StatefulWidget {
  final String hintText;
  final TextEditingController textController;
  final FocusNode focusNode;
  final bool enabled;
  final Function onChanged;

  PasswordFieldView(
      {this.hintText,
      this.textController,
      this.focusNode,
      this.enabled = true,
      this.onChanged});

  @override
  _PasswordFieldViewState createState() => _PasswordFieldViewState();
}

class _PasswordFieldViewState extends State<PasswordFieldView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PasswordFieldModel>.withConsumer(
      viewModel: PasswordFieldModel(),
      builder: (context, model, child) => TextField(
        maxLines: 1,
        enabled: widget.enabled,
        controller: widget.textController,
        focusNode: widget.focusNode,
        style: AppStyles.textStyleParagraphPrimary(context),
        autocorrect: false,
        textAlign: TextAlign.center,
        cursorColor: Provider.of<AppTheme>(context).primary,
        keyboardAppearance: Brightness.dark,
        decoration: InputDecoration(
          border: InputBorder.none,
//          contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
          hintText: widget.hintText,
          prefixIcon: Icon(
            Icons.lock,
            color: Provider.of<AppTheme>(context).primary,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              model.isPasswordHide ? Icons.visibility : Icons.visibility_off,
              color: Provider.of<AppTheme>(context).primary,
            ),
            onPressed: () {
              model.showHidePassword();
            },
          ),
//          border: new OutlineInputBorder(
//            borderRadius: const BorderRadius.all(
//              const Radius.circular(25.0),
//            ),
////            borderSide: BorderSide(color: Colors.white),
//          ),
//          filled: true,
//          fillColor: Provider.of<AppTheme>(context).backgroundDarkest,
          hintStyle: AppStyles.textStyleParagraph(context),
        ),
        obscureText: model.isPasswordHide,
        onChanged: widget.onChanged,
      ),
    );
  }
}

class PasswordFieldModel extends BaseModel {
  bool _isPasswordHide = true;
  bool get isPasswordHide => _isPasswordHide;

  showHidePassword() {
    setState(ViewState.Busy);
    _isPasswordHide = !_isPasswordHide;
    setState(ViewState.Idle);
  }
}
