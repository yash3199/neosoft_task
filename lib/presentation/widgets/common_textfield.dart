
import 'package:flutter/material.dart';

class TextFormFieldCommon extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final String? aboveText;
  final TextInputType keyboardType;
  final bool? obscureText;
  final bool? showPassword;
  const TextFormFieldCommon({required this.controller,
    required this.labelText,required this.validator,
    required this.prefixIcon, this.aboveText,required this.keyboardType,
    this.obscureText,this.suffixIcon, this.onTap, this.showPassword, super.key});

  @override
  State<TextFormFieldCommon> createState() => _TextFormFieldCommonState();
}

class _TextFormFieldCommonState extends State<TextFormFieldCommon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.aboveText ?? "", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon,color: Colors.blue[900],) : null,
            suffixIcon: widget.suffixIcon !=null? GestureDetector(
                onTap: widget.onTap ?? (){},
                child: Icon(widget.suffixIcon,color: Colors.blue[900],)):null,
            border: OutlineInputBorder(), // Always shows a border
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,), // Default border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0), // Border when focused
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0), // Border when there's an error
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0), // Border when focused and there's an error
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}