class Alerter < Formula
  desc "Send MacOS X User Alert Notifications via command-line"
  homepage "https://github.com/vjeantet/alerter"
  url "https://github.com/vjeantet/alerter/archive/1.0.tar.gz"
  sha256 "c16fb6e1937317ed75b707b56bca3f92843665a7824885c1ddcf302accc9bf5b"

  head "https://github.com/vjeantet/alerter.git"

  bottle do
    root_url "https://github.com/tmaher/homebrew-alerter/releases/download/1.0.0"
    cellar :any_skip_relocation
    sha256 "71a7f5eb0483dcbabca5caceb95cccae0a67deec6a38a432162f5d80b327535c" => :yosemite
    sha256 "50c5aab811866c6bc00912916f1c05c18d25bbecfd1bc3dd155df0fd093168fc" => :el_capitan
  end

  depends_on :macos => :mavericks
  depends_on :xcode => :build

  def install
    xcodebuild "-project", "alerter.xcodeproj",
               "-target", "alerter",
               "SYMROOT=build",
               "-verbose",
               "CODE_SIGN_IDENTITY=",
               "CODE_SIGNING_REQUIRED=NO"
    bin.install "build/Release/alerter"
  end

  test do
    system "#{bin}/alerter", "-help" if MacOS.version < :yosemite
  end
end
