require 'formula'

class Play21 < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://downloads.typesafe.com/play/2.1.1/play-2.1.1.zip'
  sha1 '3b1a0c3ca23dde36113d935b85d7f4d45f05923b'

  conflicts_with 'sox', :because => 'both install `play` binaries'
  conflicts_with 'play', :because => 'both install `play` binaries'

  def install
    system "./framework/build", "publish-local" if build.head?

    # remove Windows .bat files
    rm Dir['*.bat']
    rm Dir["#{buildpath}/**/*.bat"] if build.head?

    libexec.install Dir['*']
    bin.install_symlink libexec/'play'
  end
end
