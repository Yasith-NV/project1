import 'package:flutter/material.dart';

// Widget for a form field container with optional password visibility toggle
class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller; // Controller for the text field
  final Key? fieldKey; // Key for the form field
  final bool? isPasswordField; // Flag to determine if it's a password field
  final String? hintText; // Hint text for the field
  final String? labelText; // Label text for the field
  final String? helperText; // Helper text for the field
  final FormFieldSetter<String>?
      onSaved; // Function to call when the form is saved
  final FormFieldValidator<String>? validator; // Function to validate the field
  final ValueChanged<String>?
      onFieldSubmitted; // Function to call when field submitted
  final TextInputType? inputType; // Type of keyboard to display

  const FormContainerWidget(
      {this.controller,
      this.isPasswordField,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  _FormContainerWidgetState createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        // Toggle obscureText based on isPasswordField flag
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          // Toggle visibility icon based on isPasswordField flag
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false
                        ? const Color.fromARGB(255, 10, 40, 211)
                        : Colors.grey,
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}