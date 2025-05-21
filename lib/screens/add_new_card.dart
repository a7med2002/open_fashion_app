import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:open_fashion/components/custom_app_bar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_header.dart';

class AddNewCard extends StatefulWidget {
  final dynamic lastCard;
  const AddNewCard({super.key, this.lastCard});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final _formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expirtyDate = '';
  String holderName = '';
  String cvv = '';

  @override
  void initState() {
    if (widget.lastCard != null) {
      cardNumber = widget.lastCard['cardNumber'] ?? '';
      holderName = widget.lastCard['holderName'] ?? '';
      expirtyDate = widget.lastCard['expirtyDate'] ?? '';
      cvv = widget.lastCard['cvvCard'] ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomHeader(title: "Payment method"),
                SizedBox(height: 20),
                CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expirtyDate,
                    cardHolderName: holderName,
                    cvvCode: cvv,
                    showBackView: true,
                    isHolderNameVisible: true,
                    cardBgColor: Colors.black26,
                    onCreditCardWidgetChange: (data) {}),
                CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expirtyDate,
                    cardHolderName: holderName,
                    cvvCode: cvv,
                    onCreditCardModelChange: (model) {
                      _onCreditCardWidgetChange(model);
                    },
                    formKey: _formKey)
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            name: "add card".toUpperCase(),
            withIcon: false,
            svg: "assets/svgs/shopping bag.svg",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final cardData = {
                  'cardNumber': cardNumber,
                  'holderName': holderName,
                  'expirtyDate': expirtyDate,
                  'cvvCard': cvv
                };
                Navigator.pop(context, cardData);
              }
            },
          )
        ],
      ),
    );
  }

  void _onCreditCardWidgetChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      holderName = data.cardHolderName;
      expirtyDate = data.expiryDate;
      cvv = data.cvvCode;
    });
  }
}
