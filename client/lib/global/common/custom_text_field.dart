import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.icon,
    required this.onPressTrigger,
    required this.isLoading,
  });

  final TextEditingController textEditingController;
  final IconData icon;
  final Function() onPressTrigger;
  final bool isLoading;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: FocusNode(),
      controller: widget.textEditingController,
      decoration: InputDecoration(
        suffixIcon: widget.isLoading
            ? SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  strokeWidth: 1,
                ),
              )
            : IconButton(
                onPressed: widget.onPressTrigger,
                icon: Icon(widget.icon, color: Colors.white),
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
    );
  }
}
