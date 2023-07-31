import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tenementz/auth/login.dart';
import 'package:tenementz/homeindex/render.dart';
import 'package:tenementz/providers/authmethod.dart';
import 'package:velocity_x/velocity_x.dart';
import '../consts/colors.dart';
import '../consts/text.dart';
import '../widgets/buttons.dart';

class Authentication extends ConsumerStatefulWidget {
  const Authentication({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationState();
}

class _AuthenticationState extends ConsumerState<Authentication> {
  String? email;
  String? password;

  String? confirmpassword;
  final formkey = GlobalKey<FormState>();

  bool passmatch = false;
  bool pvisible = true;
  bool cpvisible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/logo.png',
                    width: size.width * 0.4,
                    height: size.height * 0.15,
                  ).centered(),
                  const SizedBox(height: 20),
                  Labletext(
                          text:
                              ref.watch(authmodeProvider) == AthenType.register
                                  ? "Create Account"
                                  : 'Sign in to Account')
                      .centered(),
                  const SizedBox(height: 10),
                  Labletext(
                      text: ref.watch(authmodeProvider) == AthenType.register
                          ? "Let's get started"
                          : 'Sign in to Continue'),
                  const SizedBox(height: 10),
                  Bodytext(
                      text: ref.watch(authmodeProvider) == AthenType.register
                          ? 'Hey there,Sign up to start using Tenementz'
                          : 'Hey there, we missed you.Sign in to continue using Tenementz',
                      color: kNeutral.withOpacity(0.5),
                      alignment: TextAlign.start),
                  const SizedBox(height: 30),
                  const Bodytext(
                      text: 'Email address',
                      alignment: TextAlign.start,
                      color: kDark),
                  const SizedBox(height: 5),
                  TextFormField(
                    style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: kDark),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onSaved: (value) {},
                    cursorHeight: 25,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email cannot be empty';
                      } else if (!value.contains('@')) {
                        return 'Invalid email address provided';
                      } else if (!value.contains('.com')) {
                        return 'Invalid email address provided';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffix: Icon(Icons.email),
                      hintStyle: TextStyle(
                          color: kNeutral.withOpacity(0.7),
                          fontWeight: FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: kPrimary),
                      ),
                      hintText: 'Enter a valid email address',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Bodytext(
                      text: 'Password',
                      alignment: TextAlign.start,
                      color: kNeutral),
                  const SizedBox(height: 5),
                  TextFormField(
                    obscureText: pvisible,
                    style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: kDark),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    cursorHeight: 25,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password cannot be empty';
                      } else if (value.length < 6) {
                        return 'password must be at least 6 characters';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              pvisible = !pvisible;
                            });
                          },
                          icon: pvisible == true
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                      hintStyle: TextStyle(
                          color: kNeutral.withOpacity(0.7),
                          fontWeight: FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: kPrimary),
                      ),
                      hintText: 'Enter your password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Bodytext(
                      text: 'Confirm Password',
                      alignment: TextAlign.start,
                      color: kNeutral),
                  const SizedBox(height: 5),
                  TextFormField(
                    style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: kDark),
                    onChanged: (value) {
                      confirmpassword = value;
                      if (password == confirmpassword) {
                        setState(() {
                          passmatch = true;
                        });
                      }
                    },
                    onSaved: (value) {},
                    cursorHeight: 25,
                    obscureText: cpvisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password cannot be empty';
                      } else if (value != password) {
                        return 'confirmation password does not match';
                      } else if (value.length < 6) {
                        return 'password must be at least 6 characters';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              cpvisible = !cpvisible;
                            });
                          },
                          icon: cpvisible == true
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                      hintStyle: TextStyle(
                          color: kNeutral.withOpacity(0.7),
                          fontWeight: FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1, color: kPrimary),
                      ),
                      hintText: 'Confirm your password',
                    ),
                  ),
                  const SizedBox(height: 30),
                  ClassBtn(() async {
                    FocusScope.of(context).unfocus();

                    if (formkey.currentState!.validate() == true) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        )
                            .then((value) {
                          value.user!.sendEmailVerification().whenComplete(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: 2.seconds,
                                backgroundColor: kPrimary.withOpacity(0.5),
                                content: Bodytext(
                                    color: Colors.white,
                                    alignment: TextAlign.center,
                                    text:
                                        'A verification has been sent to $email.Kindly check your email to verify.')));
                          }).then((valu) {
                            if (value.user != null) {
                              Future.delayed(5.seconds, () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Render()),
                                    (route) => false);
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: kTertiary.withOpacity(0.5),
                                content: const Bodytext(
                                    text: 'An error occurred during sign in.',
                                    color: Colors.white,
                                    alignment: TextAlign.center),
                              ));
                            }
                          });
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: 3.seconds,
                          backgroundColor: kTertiary.withOpacity(0.8),
                          content: const Bodytext(
                              text: 'An error occurred while authenticating',
                              color: Colors.white,
                              alignment: TextAlign.center),
                        ));
                      }
                    }
                  }, 'SIGNUP'),
                  const SizedBox(height: 10),
                  const Bodytext(
                          text: '======= or ======',
                          color: kNeutral,
                          alignment: TextAlign.center)
                      .centered(),
                  ClassBtn(
                      () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login())),
                      'Sign in'),
                  ClassBtnO(() async {
                    FocusScope.of(context).unfocus();

                    try {
                      final GoogleSignInAccount? googleUser =
                          await GoogleSignIn().signIn();

                      final GoogleSignInAuthentication? googleAuth =
                          await googleUser?.authentication;

                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );

                      await FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) {
                        if (value.user != null) {
                          Future.delayed(3.seconds, () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Render()),
                                (route) => false);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: kTertiary.withOpacity(0.5),
                            content: const Bodytext(
                                text: 'An error occurred during sign in.',
                                color: Colors.white,
                                alignment: TextAlign.center),
                          ));
                        }
                      }).catchError((e) {});
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: 3.seconds,
                        backgroundColor: kTertiary.withOpacity(0.8),
                        content: const Bodytext(
                            text: 'An error occurred while authenticating',
                            color: Colors.white,
                            alignment: TextAlign.center),
                      ));
                    }
                  }, 'Authenticate with Google.', Icon(Icons.facebook))
                ],
              ),
            ),
          ).animate().fadeIn(duration: 1.seconds),
        ),
      ),
    );
  }
}
