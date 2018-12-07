// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/painting.dart';

/// The height of the toolbar component of the [AppBar].
const double kToolbarHeight = 56.0;

/// The height of the bottom navigation bar.
const double kBottomNavigationBarHeight = 56.0;

/// The height of a tab bar containing text.
const double kTextTabBarHeight = 48.0;

/// The amount of time theme change animations should last.
const Duration kThemeChangeDuration = Duration(milliseconds: 200);

/// The radius of a circular material ink response in logical pixels.
const double kRadialReactionRadius = 20.0;

/// The amount of time a circular material ink response should take to expand to its full size.
const Duration kRadialReactionDuration = Duration(milliseconds: 100);

/// The value of the alpha channel to use when drawing a circular material ink response.
const int kRadialReactionAlpha = 0x1F;

/// The duration of the horizontal scroll animation that occurs when a tab is tapped.
const Duration kTabScrollDuration = Duration(milliseconds: 300);

/// The horizontal padding included by [Tab]s.
const EdgeInsets kTabLabelPadding = EdgeInsets.symmetric(horizontal: 12.0);

/// The padding added around material list items.
const EdgeInsets kMaterialListPadding = EdgeInsets.symmetric(vertical: 8.0);

const String BTN_SAVE_TEXT = "SAVE";
const String BTN_CLEAR_TEXT = "Clear";

// shared preference keys
const String CARD_DETAILS = "card_details";

//
const CONST_SELECT = "Select";

// Hints
const HING_ENTER_NUMBER = '12345-XXXXX-09989';

// error messages
const ERROR_CARD_DETAILS = "Please enter VALID CARD number";
const ERROR_COUNTRY_CODE = 'Please select country code';

// CONFIRMATION MESSAGES
const SUCCESSFUL_CARD_DETAILS = 'Saved your card details on your phone.';

const GO_HOME = '/main';
const GO_RECENT = '/recent';
const GO_CARD = '/card';
const GO_MORE = '/more';
const GO_HELP = '/help';
const GO_ABOUTUS = '/aboutus';
const GO_SETTINGS = '/settings';
const GO_PRIVACY = '/privacy';

const ETISALAT_DAIL_NUMBER = "800505,9,";
const DU_DAIL_NUMBER = "80043556,2";

const ETISALAT_DELIMETERS = "#,,,,,,,";
const DU_DELIMETERS = "#";
const TEL_DELIMETER = "tel:";
