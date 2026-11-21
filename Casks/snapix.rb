cask "snapix" do
  version "2.1.40"
  sha256 "94e66671aaa31e13b8c24f1d62ba3b9a280371453e086212adf0e30bdd40dfa5"

  url "https://cdn.snapix.app/releases/v#{version}/Snapix.zip"
  name "Snapix"
  desc "Screen capture tool with annotation, blur and on-device text recognition"
  homepage "https://snapix.app/"

  livecheck do
    url "https://snapix.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Snapix.app"

  postflight do
    puts <<~EOS

      Snapix runs in the menu bar. Open it with:

        open -a Snapix

    EOS
  end

  uninstall quit: "app.snapix.mac"

  zap trash: [
    "~/Library/Application Scripts/2KNY2RZVGC.app.snapix.mac",
    "~/Library/Application Support/Snapix",
    "~/Library/Caches/app.snapix.mac",
    "~/Library/Group Containers/2KNY2RZVGC.app.snapix.mac",
    "~/Library/HTTPStorages/app.snapix.mac",
    "~/Library/Preferences/app.snapix.mac.plist",
    "~/Library/Saved Application State/app.snapix.mac.savedState",
  ]
end
