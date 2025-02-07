class GFormat {
  static String getGreetingText() {
    final hour = DateTime.now().hour;

    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 15) {
      return 'Good Afternoon'; 
    } else if (hour >= 15 && hour < 18) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}
