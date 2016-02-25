require "formula"

class Alerter < Formula
  desc "Send User Alert Notification on Mac OS X 10.8 from the command-line."
  homepage "https://github.com/vjeantet/alerter"
  url "https://github.com/vjeantet/alerter/archive/1.0.tar.gz"
  sha256 "d2db8c86aa441306829f286bf815c88102e186237bdcda40993db8a8441b5f7c"

  head "https://github.com/vjeantet/alerter.git"

  depends_on :macos => :mountain_lion
  depends_on :xcode => :build

  def install
    xcodebuild "-project", "alerter.xcodeproj",
               "-target", "alerter",
               "SYMROOT=build",
               "-verbose"
    prefix.install Dir["build/Release/*"]
    #inner_binary = "#{prefix}/terminal-notifier.app/Contents/MacOS/terminal-notifier"
    #bin.write_exec_script inner_binary
    chmod 0755, bin/"alerter"
  end

  test do
    system "#{bin}/alerter", "-help" if MacOS.version < :yosemite
  end
end
