class GraphAssets {
  static const String _baseSvg = "asset/svg/";

  static String _getSvgPath(String pathName) {
    pathName = "$pathName.svg";
    return _baseSvg + pathName;
  }

  static const String _baseImage = "asset/images/";

  static String getImagePath(String pathName) {
    pathName = "$pathName.png";
    return _baseImage + pathName;
  }
  static String blueGraph = getImagePath('blue_graph');
  static String purpleGraph = getImagePath('purple_graph');
  static String profileImage = getImagePath('Vector');
  static String homeIconImage = getImagePath('Group');

  /// SVGs
  /// These are string variables that hold the paths of the different Svg assets in the project.
  /// They can be called by declaring SvgPicture.asset(VestiImages.stringName) eg SvgPicture.asset(VestiImages.add)

  /// 'Create' Icons
  /// Afm Utility Icons
  static String moreHorizSvg = _getSvgPath('more_horiz');
 
}
