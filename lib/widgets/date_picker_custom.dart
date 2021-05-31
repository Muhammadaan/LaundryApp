import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laundry/utils/app_helper.dart';


class DatePickerCustom extends StatefulWidget {
  final String title;
  final String hint;
  final String initialValue;
  final bool isTitleBold;
  final bool isEnabled;
  final bool isDateInput;
  final ValueChanged<String> onResult;

  const DatePickerCustom({
    Key key,
    @required this.title,
    @required this.hint,
    @required this.initialValue,
    @required this.onResult,
    this.isTitleBold = false,
    this.isEnabled = true,
    this.isDateInput = true,
  }) : super(key: key);

  @override
  _DatePickerCustomState createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  DateTime selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();
  String convertedDate;
  TextEditingController ctrlDate = new TextEditingController();

  @override
  void initState() {
    super.initState();
    if (!AppHelper.isNullOrEmptyString(widget.initialValue)) {
      ctrlDate.text = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter state) {
        return Container(
          width: width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !AppHelper.isNullOrEmptyString(widget.title),
                child: Container(
                    margin: EdgeInsets.only(bottom: 3),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              TextField(
                controller: ctrlDate,
                readOnly: true,
                enabled: widget.isEnabled,
                onTap: widget.isEnabled
                    ? () async {
                        if (!widget.isDateInput) {
                          final TimeOfDay picked = await showTimePicker(
                              context: context,
                              initialTime: selectedTime,
                              builder: (BuildContext context, Widget child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: false),
                                  child: child,
                                );
                              });

                          if (picked != null && picked != selectedTime) {
                            setState(() {
                              selectedTime = picked;
                              ctrlDate.value = TextEditingValue(
                                  text: selectedTime.format(context));
                              widget.onResult(selectedTime.format(context));
                            });
                          } else {
                            setState(() {
                              ctrlDate.value = TextEditingValue(
                                  text: selectedTime.format(context));
                              widget.onResult(selectedTime.format(context));
                            });
                          }
                        } else {
                          final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1901, 1),
                              lastDate: DateTime(2100));
                          if (picked != null && picked != selectedDate)
                            state(() {
                              selectedDate = picked;
                              convertedDate =
                                  DateFormat('dd-MM-yyyy').format(picked);
                              ctrlDate.value =
                                  TextEditingValue(text: convertedDate);
                              widget.onResult(convertedDate);
                            });
                        }
                      }
                    : null,
                decoration: new InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: widget.isEnabled ? Colors.white : Colors.grey,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 1),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[200], width: 1),
                    ),
                    hintText: widget.hint,
                    hintStyle: TextStyle(fontSize: 14)),
              )
            ],
          ),
        );
      },
    );
  }
}