if [[ $(whoami) == root ]]; then
	sudo=""
else
	sudo="sudo"
fi

$sudo apt install -y  python2.7 python-pip python2.7-dev python-virtualenv libusb-dev\
  libjpeg-dev libtiff-dev ruby ruby-rmagick libmagickwand-dev\
  ruby-hpricot scantailor ocrodjvu  djvulibre-bin libffi-dev libjpeg8-dev && \
$sudo apt-get install -y ruby-dev && \
$sudo apt-get install -y imagemagick && \
$sudo apt-get install -y graphicsmagick && \
$sudo apt-get install -y libmagickcore-dev && \
$sudo gem install rmagick && \
$sudo gem install iconv && \
$sudo gem install pdfbeads && \
$sudo pip install sexpdata && \
echo "Done!"
