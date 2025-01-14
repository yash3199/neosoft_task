import 'package:flutter/material.dart';


class CommonDropdown<T extends Enum> extends StatelessWidget {
  final T selectedValue;
  final String labelText;
  final List<T> enumValues;
  final Function(T?) onChanged;
  final aboveText;
  const CommonDropdown({
    Key? key,
    required this.selectedValue,
    required this.labelText,
    required this.enumValues,
    required this.onChanged,
    required this.aboveText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aboveText==null? SizedBox.shrink():Text( aboveText, style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        DropdownButtonFormField<T>(
          value: selectedValue,
          decoration: InputDecoration(
            hintText: labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          icon: Icon(Icons.arrow_drop_down,color: Colors.blue[900],size: 30,),
          items: enumValues.map((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(value.toString().split('.').last), // Extract enum name
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
