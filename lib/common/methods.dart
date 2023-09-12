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

String getTypePic(int type) {
  List allPic = [
    "",
    "lib/assets/common/human.png",
    "lib/assets/common/education.png",
    "lib/assets/common/health.png",
    "lib/assets/common/proverty.png",
    "lib/assets/common/environmet.png",
    "lib/assets/common/animal.png"
  ];
  return allPic[type];
}
