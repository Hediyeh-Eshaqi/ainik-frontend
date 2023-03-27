class Methods {
  static String getDeviceType(double width) {
    if (width < 481) {
      return "Mobile";
    } else if (width > 480 && width < 769) {
      return "Tablet";
    }
    return "Laptop";
  }
}
