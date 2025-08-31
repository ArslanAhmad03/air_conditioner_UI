import 'package:air_conditioner_ui/models/device_model.dart';
import 'package:air_conditioner_ui/models/support_model.dart';

/// profile screen data
final List<SupportModel> supportData = [
  SupportModel(title: 'Share Device', imagePath: 'assets/svg/share_device.svg'),
  SupportModel(title: 'Feedback', imagePath: 'assets/svg/feedback.svg'),
  SupportModel(title: 'About', imagePath: 'assets/svg/about.svg'),
  SupportModel(title: 'Migration Wizard', imagePath: 'assets/svg/wizard.svg'),
  SupportModel(title: 'FAQs', imagePath: 'assets/svg/faqs.svg'),
];

// device setting data
final List<DeviceModel> deviceData = [
  DeviceModel(title: '4T12jksd....', status: true),
  DeviceModel(title: '4T12jksd....', status: true),
  DeviceModel(title: '3Td2jksd....', status: false),
  DeviceModel(title: '4T12jksd....', status: true),
];

// cloud data
final List<Map<String, String>> days = [
  {"title": "Today", "date": "23", "month": "Jun"},
  {"title": "Mon", "date": "24", "month": "Jun"},
  {"title": "Tue", "date": "25", "month": "Jun"},
  {"title": "Wed", "date": "26", "month": "Jun"},
  {"title": "Thu", "date": "27", "month": "Jun"},
];

// add device setting data
final List<Map<String, String>> addDeviceData = [
  {"title": 'Cool', "iconPath": 'assets/svg/cool.svg', "value": '1'},
  {"title": 'Heat', "iconPath": 'assets/svg/sun.svg', "value": '5'},
  {"title": 'Fan', "iconPath": 'assets/svg/wind.svg', "value": '2'},
  {"title": 'Ai', "iconPath": 'assets/svg/ai.svg', "value": '7'},
];
