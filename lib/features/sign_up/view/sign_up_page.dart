import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ui_vault/const/colors/app_colors.dart';
import 'package:ui_vault/const/resource.dart';
import 'package:ui_vault/features/login/view/widget/login_sign_up_btn.dart';
import 'package:ui_vault/shared/widget/animations/slide_animation_builder.dart';
import 'package:ui_vault/shared/widget/buttons/app_primary_btn.dart';
import 'package:ui_vault/shared/widget/custom_text_formfield.dart';
import 'package:ui_vault/shared/widget/custom_theme_card.dart';
import 'package:ui_vault/shared/widget/dot_widget.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpView();
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _signUpFormKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;

  final ScrollController _scrollController = ScrollController();
  final FocusNode _nameFocusNode = FocusNode();
  final GlobalKey _signUpBlueContainerKey = GlobalKey();
  bool _hasScrolledToForm = false; // Track if we've already scrolled

  @override
  void initState() {
    super.initState();

    // Add listeners to focus nodes
    _nameFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_nameFocusNode.hasFocus && !_hasScrolledToForm) {
      _hasScrolledToForm = true;
      // Get the position of the blue container
      // You'll need to use a GlobalKey to get its position
      final RenderBox renderBox =
          _signUpBlueContainerKey.currentContext?.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      // Animate scrolling to the blue container
      _scrollController.animateTo(
        position.dy - 100, // Subtract a small offset to place it at the top with a little margin
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    // Reset the flag when both fields lose focus
    if (!_nameFocusNode.hasFocus) {
      _hasScrolledToForm = false;
    }
  }

  @override
  void dispose() {
    _signUpFormKey.currentState?.dispose();
    _scrollController.dispose();
    _nameFocusNode.dispose();
    _signUpBlueContainerKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SlideAnimationBuilder(
                    delay: Durations.short3,
                    child: Image.asset(
                      R.ASSETS_ILLUSTRATIONS_AUTH_ILLUSTRATION_2_PNG,
                      fit: BoxFit.contain,
                    ).objectTopCenter().h(350),
                  ),
                  Positioned(
                    top: 0,
                    right: 15,
                    child: LoginSignUpBtn(
                      isLogin: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SlideAnimationBuilder(
                  delay: Durations.medium2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Your Journey',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text('Unlock Your Experience'),
                        ],
                      ),
                      20.heightBox,
                      CustomThemeCard(
                        globalKey: _signUpBlueContainerKey,
                        child: FormBuilder(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              // Email Field
                              CustomTextFormField(
                                name: 'name',
                                focusNode: _nameFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person, color: AppColors.grey800),
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                              ),
                              20.heightBox,
                              // Email Field
                              CustomTextFormField(
                                name: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email, color: AppColors.grey800),
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ],
                                ),
                              ),
                              20.heightBox,
                              CustomTextFormField(
                                name: 'password',
                                labelText: 'Password',
                                textInputAction: TextInputAction.next,
                                isObscureText: _obscureText,
                                prefixIcon: Icon(Icons.lock, color: AppColors.grey800),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: AppColors.grey800,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                                maxLine: 1,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                ]),
                              ),
                              20.heightBox,
                              CustomTextFormField(
                                name: 'confirm_password',
                                labelText: 'Confirm Password',
                                isObscureText: _obscureText,
                                prefixIcon: Icon(Icons.password, color: AppColors.grey800),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: AppColors.grey800,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                                maxLine: 1,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                ]),
                              ),
                              12.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: AppColors.kwhite,
                                    ),
                                  ),
                                ],
                              ),
                              12.heightBox,
                              PrimaryButton(
                                labelText: 'Sign Up',
                                onPressed: () {},
                              ),
                              20.heightBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DotWidget(
                                    dashHeight: 2,
                                    dashWidth: 5,
                                    totalWidth: 100,
                                  ),
                                  Text(
                                    'or Login with',
                                    style: TextStyle(
                                      color: AppColors.kwhite,
                                    ),
                                  ).pSymmetric(h: 8),
                                  DotWidget(
                                    dashHeight: 2,
                                    dashWidth: 5,
                                    totalWidth: 100,
                                  ),
                                ],
                              ),
                              20.heightBox,
                              PrimaryButton(
                                isIcon: true,
                                icon: Image.asset(
                                  R.ASSETS_IMAGES_GOOGLE_LOGO_PNG,
                                  height: 30,
                                ),
                                fontColor: AppColors.kPrimaryColor,
                                labelText: 'Login with Google',
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.heightBox,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
