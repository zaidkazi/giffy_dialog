import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'base_dialog.dart';

/// Widget that displays Giffy Dialog with lottie asset.
///
/// You need local [lottie](https://github.com/2d-inc/lottie-Flutter) `.flr` asset for this type of Giffy Dialog.
/// Place the asset under `/assets` directory in the project root.
/// Add the asset to `pubspec.yaml` like so
/// ```
/// assets:
/// - assets/my_awesome_lottie.flr
/// ```
/// Set [LottieGiffyDialog]'s [lottiePath] prop to the asset path.
/// You also must specify the name of animation sequence to apply via `lottieAnimation` prop.
/// ```
/// lottieGiffyDialog(
///   title: Text('Example'),
///   description: Text('Dialog text'),
///   lottiePath: 'assets/my_awesome_lottie.json',
///   ...,
/// );
class LottieGiffyDialog extends StatelessWidget {
  LottieGiffyDialog({
    Key key,
    @required this.lottiePath,
    @required this.title,
    @required this.attributionUser,
    @required this.repeat,
    this.onOkButtonPressed,
    this.lottieFit = BoxFit.cover,
    this.onCancelButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.onlyCancelButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.cardBackgroundColor,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
    this.entryAnimation = EntryAnimation.DEFAULT,
  })  : assert(lottiePath != null),
        assert(title != null),
        assert(repeat != null),
        assert(attributionUser != null),
        assert(attributionUser.isNotEmpty),
        super(key: key);

  /// Path to the lottie asset.
  final String lottiePath;

  /// BoxFit sizing of the lottie asset.
  final BoxFit lottieFit;

  /// Title text.
  final Text title;

  final String attributionUser;

  final bool repeat;

  /// Description text.
  final Text description;

  /// Sets dialog to have only OK button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonCancelText], [buttonCancelColor] and [onCancelButtonPressed]
  final bool onlyOkButton;

  /// Sets dialog to have only Cancel button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonOkText], [buttonOkColor] and [onOkButtonPressed]
  final bool onlyCancelButton;

  /// Text for OK button.
  ///
  /// Default is `OK`.
  final Text buttonOkText;

  /// Text for cancel button
  ///
  /// Default is `Cancel`.
  final Text buttonCancelText;

  /// Color of OK button.
  ///
  /// Default is `Colors.green`.
  final Color buttonOkColor;

  /// Color of Cancel button
  ///
  /// Default is `Colors.grey`.
  final Color buttonCancelColor;

  /// TODO: this props is not used at the moment.
  final Color cardBackgroundColor;

  /// Radius applied to the button corners.
  ///
  /// Default is 8.
  final double buttonRadius;

  /// Radius applied to the dialog box corners.
  ///
  /// Default is 8.
  final double cornerRadius;

  /// Callback function to be called on when OK button is pressed.
  ///
  /// If set to null, then the button will be disabled and by
  /// default will resemble a flat button in the Theme's `disabledColor`.
  final VoidCallback onOkButtonPressed;

  /// Callback function to be called on when Cancel button is pressed.
  ///
  /// By default (or if set to null) closes the Giffy Dialog via `Navigator.of(context).pop()`.
  final VoidCallback onCancelButtonPressed;

  /// Defines how Giffy Dialog will enter the screen.
  ///
  /// Default is [EntryAnimation.DEFAULT] - standard Material dialog
  /// entrance animation, i.e. slow fade-in in the center of the screen.
  final EntryAnimation entryAnimation;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Lottie.asset(
      lottiePath,
      repeat: repeat,
      fit: BoxFit.scaleDown,
    );
    return BaseGiffyDialog(
      imageWidget: imageWidget,
      cornerRadius: cornerRadius,
      title: title,
      cardBackgroundColor: cardBackgroundColor,
      attributionUser: attributionUser,
      description: description,
      onlyOkButton: onlyOkButton,
      onlyCancelButton: onlyCancelButton,
      buttonCancelColor: buttonCancelColor,
      buttonRadius: buttonRadius,
      buttonCancelText: buttonCancelText,
      buttonOkColor: buttonOkColor,
      onOkButtonPressed: onOkButtonPressed,
      buttonOkText: buttonOkText,
      onCancelButtonPressed: onCancelButtonPressed,
      entryAnimation: entryAnimation,
    );
  }
}
