cask "snapix" do
  version "2.1.29"
  sha256 "16a6468e14b1caa765f56ce481f4d0669278e05323528831ad6820c88b38f33e"

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
