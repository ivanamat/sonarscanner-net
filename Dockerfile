FROM mcr.microsoft.com/dotnet/sdk:8.0
LABEL Iván Amat <iamat@knowmadmood.com>

ENV SONAR_HOST "http://localhost:9000"
ENV SONAR_TOKEN ""
ENV PROJECT_KEY ""
ENV PROJECT_PATH "."

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y openjdk-17-jre

RUN dotnet tool install --global dotnet-sonarscanner --version 6.2.0
RUN dotnet tool install --global dotnet-reportgenerator-globaltool --version 5.3.0

ENV PATH="${PATH}:/root/.dotnet/tools"

ENTRYPOINT ["/entrypoint.sh"]
