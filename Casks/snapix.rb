cask "snapix" do
  version "1.0.31"
  sha256 "7d3fc8a2351899914b3cf35b1cae731e148f3cca5aac95683d4b650e960e6acb"

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
