# LiteMiyu 的 Homebrew 配方：装 GitHub Release 上的 litemiyu-<版本>-<平台>.tar.gz 里的那一个程序。这个文件是模板，由
# `cargo xtask packaging <标签> --sums <SHA256SUMS>` 填好版本、哈希再发；别手改填出来的那份。
#
# 程序是发版时排过函数、去了符号的那一份（`cargo xtask dist`），装上的和发行包里的一字不差。macOS 只有 Apple 芯片的；
# Linux 上的 Homebrew 装 musl 全静态的那一份（x86_64、aarch64），不要任何共享库。
#
# version 一行必须写：不写的话 Homebrew 照下载地址里的文件名猜版本，Linux x86_64 那个文件名（…-linux-x86_64.tar.gz）会被
# 猜成 86.64。`brew audit` 在另外两个平台上会说这一行「和从地址里认出的版本重复」，不用照办。
class Litemiyu < Formula
  desc "Single-process agent harness for the terminal, one static program"
  homepage "https://github.com/miyu-agent/litemiyu"
  version "2026.11.0-rc.2"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/miyu-agent/litemiyu/releases/download/v2026.11.0-rc.2/litemiyu-2026.11.0-rc.2-macos-aarch64.tar.gz"
      sha256 "8aaced20e38418218c16915331ee780de15a13b2f5293a0c917467d3b8c8e996"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/miyu-agent/litemiyu/releases/download/v2026.11.0-rc.2/litemiyu-2026.11.0-rc.2-linux-x86_64.tar.gz"
      sha256 "491ae23f787ef53290282a5003098bada699f3cc4bb842ac6f08a09c754e1420"
    end

    on_arm do
      url "https://github.com/miyu-agent/litemiyu/releases/download/v2026.11.0-rc.2/litemiyu-2026.11.0-rc.2-linux-aarch64.tar.gz"
      sha256 "1dc59af31233ad181931e8a5494374647d1c567f2b3f72021ec3aa0d6a953908"
    end
  end

  def install
    bin.install "litemiyu"
    prefix.install "THIRD-PARTY-LICENSES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/litemiyu --version")
  end
end
