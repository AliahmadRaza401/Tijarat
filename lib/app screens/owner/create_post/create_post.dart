import 'dart:convert';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePostStepper extends StatefulWidget {
  @override
  _CreatePostStepperState createState() => _CreatePostStepperState();
}

class _CreatePostStepperState extends State<CreatePostStepper> {
  final _formKey = GlobalKey<FormState>();
  final _addressKey = GlobalKey<FormState>();
  final _contactKey = GlobalKey<FormState>();
  final _descKey = GlobalKey<FormState>();

  // TextEditingController title = TextEditingController();
  // TextEditingController categorey = TextEditingController();
  // TextEditingController volNumber = TextEditingController();
  // TextEditingController userIns = TextEditingController();
  // TextEditingController eventcharges = TextEditingController();
  // TextEditingController type = TextEditingController();
  // TextEditingController home = TextEditingController();
  // TextEditingController street = TextEditingController();
  // TextEditingController floor = TextEditingController();
  // TextEditingController city = TextEditingController();
  // TextEditingController postelCode = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController phone = TextEditingController();
  // TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Basic Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Select your Categorey',
        subtitle: 'Choose one Categorey given list provided',
        content: Container(
          width: MediaQuery.of(context).size.width * .9,
          child: Column(
            children: [],
          ),
        ),
        validation: () {
          // if (selectedCategorey.isEmpty) {
          //   return alertDialog(context, "Required!",
          //       'Please Click PREV select atleast one Categorey');
          // }
          // return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: stepComplete,
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
        headerColor: Color(0xff1A1A36),
        titleTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        subtitleTextStyle: TextStyle(color: Colors.white),
        iconColor: Colors.white,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1A1A36),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff1A1A36),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: stepper,
          ),
        ),
      ),
    );
  }

  stepComplete() {
    print('Steps completed!');
  }
}
