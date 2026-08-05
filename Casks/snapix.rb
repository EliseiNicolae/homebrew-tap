cask "snapix" do
  version "1.0.30"
  sha256 "79bc25dfbb8f6990b5cff51bcf8d59433ca15628d3c1eb1ac0dd92ba6fa92aac"

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
