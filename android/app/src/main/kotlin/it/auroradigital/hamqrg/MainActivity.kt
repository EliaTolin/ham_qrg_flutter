package it.auroradigital.hamqrg

import io.flutter.embedding.android.FlutterFragmentActivity

// FlutterFragmentActivity (not FlutterActivity) is required by RevenueCat's
// paywall UI (purchases_ui_flutter / presentPaywall): the native paywall is a
// DialogFragment and needs a FragmentActivity host, otherwise it throws
// PAYWALLS_MISSING_WRONG_ACTIVITY.
class MainActivity : FlutterFragmentActivity()
