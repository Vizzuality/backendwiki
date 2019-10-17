FROM python:3.7
MAINTAINER hello@vizzuality.com

RUN apt-get update -yqq && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends \
        wkhtmltopdf \
	&& \
    apt-get autoremove -yqq --purge && \
    apt-get clean

RUN mkdir /opt/docnado
RUN mkdir -p /opt/docnado/docs
WORKDIR /opt/docnado
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 5000/tcp
ENTRYPOINT ["docnado"]