import 'package:flutter/material.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_header.dart';
import 'package:open_fashion/components/custom_text_field.dart';

class AddNewAddress extends StatefulWidget {
  final dynamic lastAddress;
  const AddNewAddress({super.key, this.lastAddress});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.lastAddress != null) {
      firstnameController.text = widget.lastAddress['first'] ?? "";
      lastnameController.text = widget.lastAddress['last'] ?? "";
      addressController.text = widget.lastAddress['address'] ?? "";
      cityController.text = widget.lastAddress['city'] ?? "";
      stateController.text = widget.lastAddress['state'] ?? "";
      zipCodeController.text = widget.lastAddress['zipCode'] ?? "";
      phoneNumberController.text = widget.lastAddress['phoneNumber'] ?? "";
    }
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomHeader(title: "Add shipping adress"),
                SizedBox(height: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                              hint: "First name",
                              controller: firstnameController,
                            )),
                            SizedBox(width: 14),
                            Expanded(
                                child: CustomTextField(
                              hint: "Last name",
                              controller: lastnameController,
                            )),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hint: "Address",
                          controller: addressController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hint: "City",
                          controller: cityController,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                              hint: "State",
                              controller: stateController,
                            )),
                            SizedBox(width: 14),
                            Expanded(
                                child: CustomTextField(
                              hint: "ZIP code",
                              controller: zipCodeController,
                            )),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          hint: "Phone number",
                          controller: phoneNumberController,
                        )
                      ],
                    ))
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            name: "add now".toUpperCase(),
            withIcon: false,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Plese Fill All fields!")));
              } else {
                final address = {
                  'first': firstnameController.text,
                  'last': lastnameController.text,
                  'address': addressController.text,
                  'city': cityController.text,
                  'state': stateController.text,
                  'zipCode': zipCodeController.text,
                  'phoneNumber': phoneNumberController.text
                };
                Navigator.pop(context, address);
              }
            },
          )
        ],
      ),
    );
  }
}
