import 'package:flutter/material.dart';
import 'package:game_booking_system/components/reusable_widget.dart';

enum SnackBarType {success,error}

class SnackBarUtils{
  static void showSnackBar(
      BuildContext context,{
      required String message,
      required SnackBarType type,
      Duration duration= const Duration(seconds: 3)
    }) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Row(
            children: [
              Icon(
                type==SnackBarType.success? Icons.check_circle : Icons.error_rounded,
                color:  Colors.white,
                size: 24,
              ),
              const SizedBox(width: 12,),
              Expanded(
                  child: Text(
                      message,
                    style: AppTextStyles.bodyStyle(fontSize: 16),
                  )
              ),
            ],
          ),
        backgroundColor: type== SnackBarType.success ? Color.fromRGBO(136, 241, 83, 1) : Color.fromRGBO(240, 52, 52, 1),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      )
    );
  }
}