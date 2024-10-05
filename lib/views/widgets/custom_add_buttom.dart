import 'package:flutter/material.dart';
import 'package:notes_app/constant/app_constatnt.dart';

class CustomAddButtom extends StatelessWidget {
  const CustomAddButtom({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  color: Colors.black45,
                ),
              )
            : const Text(
                "Add",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
      ),
    );
  }
}
