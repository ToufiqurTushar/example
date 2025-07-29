import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';

class NotifictionListLogic extends RapidStartLogic {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var formController = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'mobile': TextEditingController(),
    'dateOfBirth': TextEditingController(),
    'gender': TextEditingController()
  };
  var formValidateMode = AutovalidateMode.disabled.obs;
  var name = 'Touhid Mia'.obs;
  var gender = "".obs;
  var hideSearchBar = true.obs;
  var selectedFilter = 'Tasks'.obs; // Default selected filter
  var showCompleted = false.obs;

  @override
  void onInit() {
    super.onInit();


  }

  void formSubmit() {
    final data = formController.data();
    if (!formKey.currentState!.validate()) {
      formValidateMode.value = AutovalidateMode.always;
      return ;
    }

    RLog.info(data);
  }

  // Define a list of cattle data using Maps
  final List<Map<String, dynamic>> notifictionData = const [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 36',
      'statusText': 'Inseminated on Dec 30, 2024, 103 remaining days to estimated calving date',
      'statusColor': Colors.green,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 37',
      'statusText': '(58 days left) Change feeding pattern for DRY Period gradually!',
      'statusColor': Colors.orange,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 1',
      'statusText': 'Apply Bovine Rotavirus-Coronavirus Vaccine 3-6 weeks before calving!',
      'statusColor': Colors.red,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 17',
      'statusText': '(Day 152) Estimated days to calving: 132',
      'statusColor': Colors.blue,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 41',
      'statusText': '(Day 121) Estimated days to calving: 162',
      'statusColor': Colors.blue,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 08',
      'statusText': 'Healthy and producing milk.',
      'statusColor': Colors.lightGreen,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
      'cattleId': 'RR 12',
      'statusText': 'Due for vaccination next month.',
      'statusColor': Colors.purple,
    },
  ];


}