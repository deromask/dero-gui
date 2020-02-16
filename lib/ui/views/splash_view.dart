import 'package:dero/core/enums/viewstate.dart';
import 'package:dero/core/models/wallet_state.pb.dart';
import 'package:dero/core/viewmodels/splash_model.dart';
import 'package:dero/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';

/// Splash
/// Default page route that determines the app state and routes them appropriately.
/// This may run multiple time not just at application start
class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashModel>.withConsumer(
      viewModel: SplashModel(),
      onModelReady: (model) {
        model.checkAppState(Provider.of<WalletState>(context));
      },
      builder: (context, model, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          String nextRoute = model.nextRoute == null || model.nextRoute == ""
              ? "/welcome"
              : model.nextRoute;
          print("nextRoute: " + nextRoute);
          Navigator.of(context).pushReplacementNamed(nextRoute);
        });
        if (model.state == ViewState.Busy) {
          print("checking app state");
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Provider.of<AppTheme>(context).background,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        //Width/Height ratio for the animation is needed because BoxFit is not working as expected
                        width: MediaQuery.of(context).size.width * 5 / 9,
                        height: MediaQuery.of(context).size.width * 5 / 9,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
