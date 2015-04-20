FROM codenvy/jdk7
ENV CF_API <your api>
ENV CF_LOGIN <your login or email>
ENV CF_PASSWORD <your password>
ENV CF_ORG <organization to target>
ENV CF_SPACE <space to target>

RUN sudo apt-get update
RUN sudo apt-get -y install php5-cli

RUN mkdir /home/user/cf
WORKDIR /home/user/cf
RUN wget -q http://go-cli.s3-website-us-east-1.amazonaws.com/releases/v6.11.0/cf-cli_amd64.deb && \
    sudo dpkg -i cf-cli_amd64.deb
RUN mkdir /home/user/app
WORKDIR /home/user/app

RUN cf login --skip-ssl-validation -a ${CF_API} -u ${CF_LOGIN} -p ${CF_PASSWORD} -o ${CF_ORG} -s ${CF_SPACE}
VOLUME ["/home/user/app"]
ENV CODENVY_APP_BIND_DIR /home/user/app

EXPOSE 8080
ENV CODENVY_APP_PORT_8080_HTTP 8080

CMD appName=`cat manifest.yml | grep name | sed 's/-/ /' | awk '{print $2}'`; \
    domain=`cf domains | sed -n '3p' | awk '{print $1}'`; \
    url=`echo "http://${appName}.${domain}"`; \
    echo "<meta http-equiv=\"refresh\" content=\"0; URL=${url}\">" > toserve.php && \
    cf push >&1 && \
    (php -S 0.0.0.0:8080 toserve.php&) && \
    cf logs ${appName} >&1
