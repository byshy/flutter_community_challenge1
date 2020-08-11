import 'package:flutter/material.dart';
import '../constant.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  CustomButton({@required this.onPressed,@required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 28.0),
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          height: 60,
          child: Center(
            child: Row(
              children: <Widget>[
                child,
                Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: blue253952,
      ),
    );
  }
}
