class Gothanks < Formula
  desc "Star Go and the GitHub dependencies in a go.mod file"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "932915b470a3c55edf6b6524d0062a762ae79c2c9b39685aa1a53aae53449265"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "Usage of", shell_output("#{bin}/gothanks -h 2>&1")
  end
end
