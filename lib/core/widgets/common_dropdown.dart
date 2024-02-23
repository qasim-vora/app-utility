import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../core/models/common_dropdown_model.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/font_constants.dart';
import '../../core/styles/ui_constants.dart';
import 'common_text.dart';

class CommonDropDown extends StatefulWidget {
  final Function(DropdownModel)? selectedValue;
  final List<DropdownModel>? dropDownValueList;
  DropdownModel? dropDownValue;
  String placeHolder;

  CommonDropDown(
      {super.key,
      this.selectedValue,
      this.dropDownValueList,
      this.dropDownValue,
      required this.placeHolder});

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UIConstants.kTextFieldBorderRadius),
        border: Border.all(
            color: AppColors.fieldBorderColor,
            style: BorderStyle.solid,
            width: 0.80),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<DropdownModel>(
          isExpanded: true,
          hint: widget.dropDownValue == null
              ? CommonText(
                  text: widget.placeHolder,
                  fontFamily: FontFamilyConstants.fontName,
                  color: AppColors.blackColor,
                  fontSize: FontConstants.font_16,
                  fontWeight: FontWeight.w500,
                )
              : CommonText(
                  text: widget.dropDownValue!.label,
                  fontFamily: FontFamilyConstants.fontName,
                  color: AppColors.blackColor,
                  fontSize: FontConstants.font_16,
                  fontWeight: FontWeight.w500,
                ),
          items: widget.dropDownValueList!
              .map((DropdownModel item) => DropdownMenuItem<DropdownModel>(
                    value: item,
                    child: CommonText(
                      text: item.label,
                      color: Colors.black,
                    ),
                  ))
              .toList(),
          // value: widget.dropDownValue == null
          //     ? 'Dropdown'
          //     : widget.dropDownValue!,
          onChanged: (value) {
            widget.selectedValue!(value!);
            setState(
              () {
                widget.dropDownValue = value;
              },
            );
          },
          buttonStyleData: ButtonStyleData(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(14),
            //   border: Border.all(
            //     color: Colors.black26,
            //   ),
            //   color: Colors.redAccent,
            // ),
            elevation: 2,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            // width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              // color: Colors.redAccent,
            ),
            offset: const Offset(0, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),

      /*DropdownButton(
        underline: Container(),
        hint: widget.dropDownValue == null
            ? CommonText(text: 'Dropdown')
            : CommonText(
          text: widget.dropDownValue!,),
        isExpanded: true,
        // value: widget.dropDownValue,
        iconSize: 30.0,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          overflow: TextOverflow.ellipsis,
          fontFamily: FontFamilyConstants.fontName,
        ),
        items: widget.dropDownValueList!.map(
              (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: CommonText(
                text: val,
                color: Colors.black,
              ),
            );
          },
        ).toList(),
        onChanged: (val) {
          widget.selectedValue!(val!);
          setState(
                () {
              widget.dropDownValue = val;
            },
          );
        },
      )*/
    );
  }
}
