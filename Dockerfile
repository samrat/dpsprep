FROM ubuntu:18.04
SHELL ["/bin/bash", "-c"]
MAINTAINER Junoh Moon
ENV LANG=C.UTF-8
ENV HOME=/root


RUN sed -i -e 's|disco|eoan|g' /etc/apt/sources.list
ENV SL=/etc/apt/sources.list
RUN cp ${SL} ${SL}.org
RUN sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' < ${SL}.org > ${SL}
RUN apt-get update

ADD ./dpsprep /usr/bin/dpsprep
ADD ./install_dependencies.sh $HOME/install_dependencies.sh
#RUN $HOME/install_dependencies.sh

#RUN apt-get -y install software-properties-common&& \
#		apt-add-repository -y ppa:brightbox/ruby-ng&& \
#		apt-get update

RUN apt install -y  python2.7 python-pip python2.7-dev python-virtualenv libusb-dev
RUN apt install -y libjpeg-dev libtiff-dev ruby ruby-rmagick libmagickwand-dev
RUN apt install -y scantailor
RUN apt install -y ruby-hpricot ocrodjvu  djvulibre-bin libffi-dev libjpeg8-dev 
RUN apt-get install -y ruby-dev;
#RUN apt-get install -y imagemagick 
RUN curl -o /usr/bin/imagemagick https://imagemagick.org/download/binaries/magick && chmod 777 /usr/bin/imagemagick
RUN apt-get install -y graphicsmagick 
RUN apt-get install -y libmagickcore-dev 
RUN gem install iconv && \
		gem install pdfbeads && \
		pip install sexpdata

#RUN apt install -y default-jre-headless libcommons-lang3-java libbcprov-java \
#		git default-jdk-headless ant \
#		libcommons-lang3-java libbcprov-java
#
#RUN git clone -b v3.1.3 https://gitlab.com/pdftk-java/pdftk.git .pdftk && \
#			cd .pdftk && \
#			mkdir libs && \
#			ln -st libs /usr/share/java/{commons-lang3,bcprov}.jar && \
#			ant jar && \
#			echo "java -jar $HOME/.pdftk/build/jar/pdftk.jar" >> /usr/bin/pdftk && \
#			chmod 777 /usr/bin/pdftk
RUN curl -o /usr/bin/pdftk https://gitlab.com/pdftk-java/pdftk/-/jobs/605967170/artifacts/raw/build/native-image/pdftk && chmod 777 /usr/bin/pdftk
WORKDIR $HOME
RUN dpsprep --help
