import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/viewmodels/base_model.dart';
import 'package:dero/ui/dimens.dart';
import 'package:dero/ui/widgets/buttons.dart';
import 'package:dero/util/utils.dart' show waitAfter;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/provider_architecture.dart';

class CopyButtonView extends StatefulWidget {
  final String title;
  final String data;

  CopyButtonView(this.title, this.data);

  @override
  _CopyButtonViewState createState() => _CopyButtonViewState();
}

class _CopyButtonViewState extends State<CopyButtonView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CopyButtonModel>.withConsumer(
      viewModel: CopyButtonModel(),
      builder: (context, model, child) => AppButton.buildAppButton(
        context,
        // Share Address Button
        model.state == ViewState.Idle
            ? AppButtonType.PRIMARY
            : AppButtonType.SUCCESS,
        model.state == ViewState.Idle ? widget.title : "Copied",
        Dimens.BUTTON_TOP_DIMENS,
        onPressed: () async {
          Clipboard.setData(new ClipboardData(text: widget.data));
          await model.delay();
        },
      ),
    );
  }
}

class CopyButtonModel extends BaseModel {
  Future delay() async {
    setState(ViewState.Busy);
    await waitAfter(800);
    setState(ViewState.Idle);
  }
}
