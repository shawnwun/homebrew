require 'formula'

class Urweb < Formula
  homepage 'http://impredicative.com/ur/'
  url 'http://impredicative.com/ur/urweb-20111127.tgz'
  md5 '33276fad9dc6b06782f041bccbdef7ac'
  head 'http://hg.impredicative.com/urweb', :using => :hg

  depends_on 'mlton'

  def install
    system "aclocal && autoreconf -i --force"
    system "./configure --prefix=#{prefix}"
    system "make"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Programs generated by the Ur/Web compiler can use SQLite,
    PostgreSQL, or MySQL for the data store. You probably want to
    install either PostgreSQL or MySQL if you're going to deploy
    real apps or test them heavily.
    EOS
  end
end