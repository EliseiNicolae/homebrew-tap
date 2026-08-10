cask "snapix" do
  version "1.1.3"
  sha256 "b289dd117f3fbc198476ed145e86781ac568dde45de5d78bd20fbc911182aecd"

  url "https://cdn.snapix.app/releases/v#{version}/Snapix.dmg"
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

  uninstall quit: "com.snapix"

  zap trash: [
    "~/Library/Application Scripts/com.snapix",
    "~/Library/Application Support/Snapix",
    "~/Library/Caches/com.snapix",
    "~/Library/Containers/com.snapix",
    "~/Library/HTTPStorages/com.snapix",
    "~/Library/Logs/Snapix-recording.log",
    "~/Library/Preferences/com.snapix.plist",
  ]
end
