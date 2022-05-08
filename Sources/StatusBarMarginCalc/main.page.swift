import ScadeKit

#if os(Android)
  import Android
  import AndroidApp
  import AndroidContent
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    #if os(iOS)
      if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        self.label.text = "iOS, top: \(topPadding) bottom: \(bottomPadding)"

        print("iOS, top: \(topPadding) bottom: \(bottomPadding)")
        print(bottomPadding)

      }
    #endif

    #if os(Android)

      var res: Resources? = Application.currentActivity?.getResources()

      var resID: Int32 =
        res?.getIdentifier(name: "status_bar_height", defType: "dimen", defPackage: "android") ?? 0

      var result:Int32 = res?.getDimensionPixelSize(id: resID) ?? 111

      var resBottomID: Int32 =
        res?.getIdentifier(name: "navigation_bar_height", defType: "dimen", defPackage: "android")
        ?? 0

      var resultBottom: Int32 = res?.getDimensionPixelSize(id: resBottomID) ?? 333


      self.label.text = "Android, Top: \(result) Bottom: \(resultBottom)"

    #endif

  }
}
