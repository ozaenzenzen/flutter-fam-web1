class AppRoutePath {
  final dynamic id;
  final bool isUnknown;

  AppRoutePath.home()
      : id = null,
        isUnknown = false;
  AppRoutePath.about()
      : id = null,
        isUnknown = false;
  AppRoutePath.project()
      : id = null,
        isUnknown = false;
  AppRoutePath.ongoing()
      : id = null,
        isUnknown = false;
  AppRoutePath.blog()
      : id = null,
        isUnknown = false;
  AppRoutePath.contact()
      : id = null,
        isUnknown = false;
  AppRoutePath.projectDetails(this.id) : isUnknown = false;

  AppRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHome => id == null;
  bool get isAbout => id == null;
  bool get isProject => id == null;
  bool get isOngoing => id == null;
  bool get isBlog => id == null;
  bool get isContact => id == null;
  bool get isProjectDetails => id != null;
  
}