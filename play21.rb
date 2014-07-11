require 'formula'

class Play21 < Formula
  homepage 'http://www.playframework.org/'
  head 'https://github.com/playframework/playframework.git'
  url 'http://s3.amazonaws.com/amplify-shared/play-2.1.1.zip'
  sha1 '3b1a0c3ca23dde36113d935b85d7f4d45f05923b'

  conflicts_with 'sox', :because => 'both install `play` binaries'
#  conflicts_with 'play', :because => 'both install `play` binaries'

  def install
    rm Dir['*.bat'] # remove windows' bat files
    libexec.install Dir['*']
    inreplace libexec+"play" do |s|
      s.gsub! "$dir/", "$dir/../libexec/"
      s.gsub! "dir=`dirname $PRG`", "dir=`dirname $0` && dir=$dir/`dirname $PRG`"
    end
    bin.install_symlink libexec+'play'
  end
end
