import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ui_vault/const/borders/app_borders.dart';
import 'package:ui_vault/const/colors/app_colors.dart';
import 'package:ui_vault/const/resource.dart';
import 'package:ui_vault/features/login/view/widget/login_image_illustration.dart';
import 'package:ui_vault/features/login/view/widget/sign_up_btn.dart';
import 'package:ui_vault/shared/widget/animations/slide_animation_builder.dart';
import 'package:ui_vault/shared/widget/buttons/app_primary_btn.dart';
import 'package:ui_vault/shared/widget/custom_text_formfield.dart';
import 'package:ui_vault/shared/widget/dot_widget.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage(
  deferredLoading: true,
)
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;

  final ScrollController _scrollController = ScrollController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final GlobalKey _blueContainerKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Add listeners to focus nodes
    _emailFocusNode.addListener(_handleFocusChange);
    _passwordFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) {
      // Get the position of the blue container
      // You'll need to use a GlobalKey to get its position
      final RenderBox renderBox = _blueContainerKey.currentContext?.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      // Animate scrolling to the blue container
      _scrollController.animateTo(
        position.dy - 10, // Subtract a small offset to place it at the top with a little margin
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _scrollController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

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
                    child: const LoginIllustrationImage().objectTopCenter().h(350),
                  ),
                  Positioned(
                    top: 0,
                    right: 15,
                    child: SignUpBtn(),
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
                            'Welcome back!',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text('Enter your email & password'),
                        ],
                      ),
                      20.heightBox,
                      Container(
                        key: _blueContainerKey,
                        // height: 400,
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: AppBorder.kFullMiddleCurve,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.kPrimaryColor.withOpacity(0.95),
                              AppColors.kPrimaryColor.withOpacity(1.0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3), // Darker shadow for depth
                              blurRadius: 30, // Increased blur for smooth effect
                              offset: const Offset(10, 20), // Bigger offset for elevation
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15), // Lighter shadow for realism
                              blurRadius: 15,
                              offset:
                                  const Offset(-5, -5), // Soft top-left shadow for floating feel
                            ),
                          ],
                        ),
                        child: FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Email Field
                              CustomTextFormField(
                                name: 'Email',
                                focusNode: _emailFocusNode,
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
                                focusNode: _passwordFocusNode,
                                labelText: 'Password',
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
                                labelText: 'Login',
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
