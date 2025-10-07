import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'result_screen.dart';

class AllFieldsFormScreen extends StatefulWidget {
  const AllFieldsFormScreen({super.key});

  @override
  State<AllFieldsFormScreen> createState() => _AllFieldsFormScreenState();
}

class _AllFieldsFormScreenState extends State<AllFieldsFormScreen> {
  final _multilineTextController = TextEditingController();
  String? _selectedRadioValue = 'product 2';
  bool _switchValue = false;
  final Map<String, bool> _checkboxValues = {
    'product 1': true,
    'product 2': false,
    'product 3': false,
  };

  String? _selectedDropdownValue = 'product 1';
  final List<String> _dropdownItems = ['product 1', 'product 2', 'product 3'];

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }


  void _sendData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          displayText: _multilineTextController.text,
        ),
      ),
    );
  }

  Future<bool?> _showExitConfirmDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure you want to go back?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),

          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _multilineTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async {
          final shouldPop = await _showExitConfirmDialog(context);
          return shouldPop ?? false;
        },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('All Fields', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('TareaText test'),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: _multilineTextController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'hola a todos',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24.h),
      
                _buildSectionTitle('Radio Button tests'),
                for (var item in _dropdownItems)
                  RadioListTile<String>(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(item),
                    value: item,
                    groupValue: _selectedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadioValue = value;
                      });
                    },
                  ),
                SizedBox(height: 24.h),
      
      
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: _buildSectionTitle('Switch test'),
                  trailing: Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                _buildSectionTitle('Checkbox test'),
                for (var key in _checkboxValues.keys)
                  CheckboxListTile(
                    title: Text(key),
                    value: _checkboxValues[key],
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (value) {
                      setState(() {
                        _checkboxValues[key] = value!;
                      });
                    },
                  ),
                SizedBox(height: 24.h),
                _buildSectionTitle('Select test'),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  value: _selectedDropdownValue,
                  items: _dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDropdownValue = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _sendData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    child: Text('Send', style: TextStyle(fontSize: 18.sp)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}