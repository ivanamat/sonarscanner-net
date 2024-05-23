# SonarQube Scanner for .NET

This repository contains a simple and clean Dockerfile and Entrypoint script to build a Docker image of SonarQube scanner for .NET.

## Library versions

* **base image**: mcr.microsoft.com/dotnet/sdk:8.0
* **jre**: openjdk-17-jre
* **dotnet-sonarscanner**: 6.2.0
* **dotnet-reportgenerator-globaltool**: 5.3.0

## Build

Yoy can build the image downloading code and executing:

```bash
docker build -t sonarscanner-net .
```

## Environment

In order to run the container, you need to specify the environment variables.

**SONAR_HOST** sechema://host:port of your SonarQube instance. Default is http://localhost:9000  
**SONAR_TOKEN** Required. SonarQube token.  
**PROJECT_KEY** Required. Project KEY  
**PROJECT_PATH** Required. Path to your.csproj or .nls file  

## Use

```bash
docker run -v /home/user/samples:/samples -e SONAR_HOST='<https://my-sonar-host:port>' -e SONAR_TOKEN='<my-sonar-token>' -e PROJECT_KEY='<my-sonar-project-key>' -e PROJECT_PATH='/samples/my/sonar/project/path' -it sonarscanner-net
```
**NOTE**: If the image is to be used on GitHub or GitLab pipeline, mounting the source code path is unnecessary.

