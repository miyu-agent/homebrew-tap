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
  version "2026.11.1"
  license "AGPL-3.0-or-later"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/miyu-agent/litemiyu/releases/download/v2026.11.1/litemiyu-2026.11.1-macos-aarch64.tar.gz"
      sha256 "f9e5a2a49cf80fc9224fcd99a1cbcb3d7441743e54f0038654c43fa427b8232d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/miyu-agent/litemiyu/releases/download/v2026.11.1/litemiyu-2026.11.1-linux-x86_64.tar.gz"
      sha256 "86a1ef986b07833edaae6dd3571671ebc534e242d3af6af5c583031a944fe91c"
    end

    on_arm do
      url "https://github.com/miyu-agent/litemiyu/releases/download/v2026.11.1/litemiyu-2026.11.1-linux-aarch64.tar.gz"
      sha256 "66c6574f1094463313ae0bfed43804c4d80babfbfc58557dbd19e3ddcd9fb245"
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
