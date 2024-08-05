import 'package:flutter/material.dart';
import 'account_created.dart'; // Import the new page


//Ιωάννα

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<String> placeholderTexts = [
    'First Name',
    'Last Name',
    'Email address',
    'Password',
    'Confirm password',
  ];

  Color createAccountButtonColor = Color.fromRGBO(44, 61, 143, 1.0);
  Color googleButtonColor = Color.fromRGBO(246, 246, 248, 1);
  Color facebookButtonColor = Color.fromRGBO(44, 61, 143, 1.0);

  bool isChecked = false;
  bool isFormValid = false;

//---------------------------------------------------CONTROLLERS---------------------------------------------------------

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

//---------------------------------------------------ACTION_LISTENERS----------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_checkFormValidity);
    _lastNameController.addListener(_checkFormValidity);
    _emailController.addListener(_checkFormValidity);
    _passwordController.addListener(_checkFormValidity);
    _confirmPasswordController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

//---------------------------------------------------VERIFICATION_FOR_CONTROLLERS---------------------------------------------------------

  void _checkFormValidity() {
    setState(() {
      isFormValid = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          isChecked;
    });
  }

//---------------------------------------------------CREATE_ACCOUNT_BOXES---------------------------------------------------------

  void _createAccount() {
    if (isFormValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountCreatedPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildInitialBox(),
              SizedBox(height: 40),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 34,
                  color: Color.fromRGBO(44, 61, 143, 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              buildTextBox(
                  controller: _firstNameController,
                  placeholderText: placeholderTexts[0]),
              SizedBox(height: 15),
              buildTextBox(
                  controller: _lastNameController,
                  placeholderText: placeholderTexts[1]),
              SizedBox(height: 15),
              buildTextBox(
                  controller: _emailController,
                  placeholderText: placeholderTexts[2]),
              SizedBox(height: 15),
              buildTextBox(
                  controller: _passwordController,
                  placeholderText: placeholderTexts[3]),
              SizedBox(height: 15),
              buildTextBox(
                  controller: _confirmPasswordController,
                  placeholderText: placeholderTexts[4]),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                        _checkFormValidity();
                      });
                    },
                  ),
                  Text('I agree to the terms and conditions'),
                ],
              ),
              SizedBox(height: 10),
              buildCircularButton(),
              SizedBox(height: 8),
              Text(
                'or',
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(44, 104, 226, 1),
                ),
              ),
              SizedBox(height: 8),
              buildCircularButtonGoogle(),
              SizedBox(height: 8),
              buildCircularButtonFacebook(),
              SizedBox(height: 50),
              buildInitialBoxLogo(),
            ],
          ),
        ),
      ),
    );
  }

//---------------------------------------------------UPPER_LOG0---------------------------------------------------------

  Widget buildInitialBox() {
    return Container(
      color: Color.fromRGBO(44, 61, 143, 1.0),
      width: double.infinity,
      padding: EdgeInsets.only(top: 70.0),
      child: Container(
        width: 400,
        height: 82,
        color: Color.fromRGBO(44, 61, 143, 1.0),
        child: Center(
          child: Text(
            'iDerma',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

//---------------------------------------------------TEXT_BOXES---------------------------------------------------------

  Widget buildTextBox(
      {required TextEditingController controller,
      required String placeholderText}) {
    return Container(
      width: 210.15,
      height: 32,
      decoration: BoxDecoration(
        color: Color.fromRGBO(205, 222, 255, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholderText,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(44, 61, 143, 1.0),
                ),
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

//---------------------------------------------------CREATE_ACCOUNT_BUTTON--------------------------------------------------------

  Widget buildCircularButton() {
    return GestureDetector(
      onTap: isFormValid ? _createAccount : null,
      onTapDown: (_) {
        if (isFormValid) {
          setState(() {
            createAccountButtonColor = Color.fromRGBO(205, 222, 255, 1.0);
          });
        }
      },
      onTapUp: (_) {
        if (isFormValid) {
          setState(() {
            createAccountButtonColor = Color.fromRGBO(44, 61, 143, 1.0);
          });
        }
      },
      child: Container(
        width: 210,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isFormValid ? createAccountButtonColor : Colors.grey,
        ),
        child: Center(
          child: Text(
            'Create Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

//---------------------------------------------------GOOGLE_SIGN_IN---------------------------------------------------------

  Widget buildCircularButtonGoogle() {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          googleButtonColor = Colors.grey.withOpacity(0.5);
        });
      },
      onTapUp: (_) {
        setState(() {
          googleButtonColor = Colors.white;
        });
      },
      child: Container(
        width: 210,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: googleButtonColor,
          border: Border.all(
            color: const Color.fromARGB(255, 18, 18, 18).withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.g_translate_rounded,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              'Sign Up with Google',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

//---------------------------------------------------FACEBOOK_SIGN_IN---------------------------------------------------------

  Widget buildCircularButtonFacebook() {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          facebookButtonColor = Colors.grey.withOpacity(0.5);
        });
      },
      onTapUp: (_) {
        setState(() {
          facebookButtonColor = Colors.white;
        });
      },
      child: Container(
        width: 210,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: facebookButtonColor,
          border: Border.all(
            color: const Color.fromARGB(255, 13, 13, 13).withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.facebook,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              'Sign Up with Facebook',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

//---------------------------------------------------LOWER_LOG0---------------------------------------------------------

  Widget buildInitialBoxLogo() {
    return Container(
      color: Color.fromRGBO(44, 61, 143, 1.0),
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        width: 60,
        height: 52,
        color: Color.fromRGBO(44, 61, 143, 1.0),
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                'EMB AUTH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
