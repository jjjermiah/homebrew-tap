class DumpDir < Formula
  desc "CLI to dump directory structure and metadata"
  homepage "https://github.com/fargusplumdoodle/dump_dir"
  license "MIT"
  # -- VERSION ----------------------------------------------------------
  # IMPORTANT:
  # Set this to the latest release tag of the upstream repo.
  # Example: v0.4.1 or 0.4.1 depending on their tags.
  version "v1.2.4" # <--- update this manually each release
  # ---------------------------------------------------------------------

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fargusplumdoodle/dump_dir/releases/download/#{version}/dump_dir_darwin_arm64"
      sha256 "1326c59b482317b62edf002195e8613c0a4e1f9c6098563ea1c9a80e716b9ae5"
    else
      url "https://github.com/fargusplumdoodle/dump_dir/releases/download/#{version}/dump_dir_darwin_amd64"
      sha256 "46a4b018ae92a2bfac2b083d0e5095a892132ff6d33168671c938079417b7470"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fargusplumdoodle/dump_dir/releases/download/#{version}/dump_dir_linux_arm64"
      sha256 "23dcdddb228ef3ee476fb402ec483f4640d1e746f983253d236cef72169c49f2"
    else
      url "https://github.com/fargusplumdoodle/dump_dir/releases/download/#{version}/dump_dir_linux_amd64"
      sha256 "95f49e70a81dedbc85a4685d913f5d33032b7a28e9e846f2ce719ba96e60a9c2"
    end
  end

  def install
    # Rename binary to the formula name
    bin.install Dir["dump_dir*"].first => "dump_dir"
  end

  test do
    system "#{bin}/dump_dir", "--help"
  end
end
