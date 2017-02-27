class Httpie < Formula
  include Language::Python::Virtualenv

  desc "User-friendly cURL replacement (command-line HTTP client)"
  homepage "https://httpie.org/"
  url "https://github.com/jkbrzt/httpie/archive/0.9.8.tar.gz"
  sha256 "5ccc65dd8e60a9310f575c1a9600f3cc7daf8704cc88bf6c40118b3659b98dc7"
  revision 2
  head "https://github.com/jkbrzt/httpie.git"

  bottle do
    sha256 "2dec6b0b3240edd2fbbfef596f9d743a6360408c38bb37f193fe27e0189ede56" => :sierra
    sha256 "fcd8779f4eb9b793142e16da828d85b8b76530c58fb2844e17c0fdd9a70c0cbc" => :el_capitan
    sha256 "9c579afbebbc6e5341483aae03845768313e965cf80d6f893ffce77e13a01174" => :yosemite
  end

  depends_on :python3

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz"
    sha256 "88e4c8a91b2af5962bfa5ea2447ec6dd357018e86e94c7d14bd8cacbc5b55d81"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/d9/03/155b3e67fe35fe5b6f4227a8d9e96a14fda828b18199800d161bcefc1359/requests-2.12.3.tar.gz"
    sha256 "de5d266953875e9647e37ef7bfe6ef1a46ff8ddfe61b5b3652edf7ea717ee2b2"
  end

  resource "PySocks" do
    url "https://files.pythonhosted.org/packages/fd/70/ba9982cedc9b3ed3c06934f1f46a609e0f23c7bfdf567c52a09f1296b8cb/PySocks-1.6.6.tar.gz"
    sha256 "02419a225ff5dcfc3c9695ef8fc9b4d8cc99658e650c6d4718d4c8f451e63f41"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    raw_url = "https://raw.githubusercontent.com/Homebrew/homebrew-core/master/Formula/httpie.rb"
    assert_match "PYTHONPATH", shell_output("#{bin}/http --ignore-stdin #{raw_url}")
  end
end
