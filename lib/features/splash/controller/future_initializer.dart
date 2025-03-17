import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:platform_info/platform_info.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';
import 'package:ui_vault/bootstrap.dart';
import 'package:ui_vault/core/local_storage/app_storage_pod.dart';
import 'package:ui_vault/features/splash/controller/box_encryption_key_pod.dart';
import 'package:ui_vault/i18n/strings.g.dart';
import 'package:ui_vault/init.dart';
import 'package:ui_vault/shared/pods/internet_checker_pod.dart';
import 'package:ui_vault/shared/pods/translation_pod.dart';

final futureInitializerPod = FutureProvider.autoDispose<ProviderContainer>((ref) async {
  ///Additional intial delay duration for app
  await Future.delayed(const Duration(seconds: 2));
  await (init());
  await Hive.initFlutter();

  ///Replace `appBox` namw with any key you want

  final encryptionCipher = await Platform.I.when(
    mobile: () async {
      final encryptionKey = await ref.watch(boxEncryptionKeyPod.future);
      return HiveAesCipher(encryptionKey);
    },
  );

  ///Load device translations
  ///
  AppLocale deviceLocale = AppLocaleUtils.findDeviceLocale();
  final translations = await deviceLocale.build();

  final appBox = await Hive.openBox(
    'UiVaultAppBox',
    encryptionCipher: encryptionCipher,
  );
  return ProviderContainer(
    overrides: [
      appBoxProvider.overrideWithValue(appBox),
      translationsPod.overrideWith(
        (ref) => translations,
      ),
      enableInternetCheckerPod.overrideWithValue(false),
    ],
    observers: [
      ///Added new talker riverpod observer
      ///
      /// If you want old behaviour
      /// Replace with
      ///
      ///  MyObserverLogger( talker: talker,)
      ///
      ///
      ///
      ///
      TalkerRiverpodObserver(
        talker: talker,
        settings: const TalkerRiverpodLoggerSettings(
          printProviderDisposed: true,
        ),
      ),
    ],
  );
});
