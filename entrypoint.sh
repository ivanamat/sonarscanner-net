#!/bin/bash

echo $SONAR_HOST
echo $SONAR_TOKEN
echo $PROJECT_KEY
echo $PROJECT_PATH

if [[ -z "${SONAR_HOST}" ]]; then
    echo "Debes proporcionar SONAR_HOST"
fi

if [[ -z "${SONAR_TOKEN}" ]]; then
    echo "Debes proporcionar SONAR_TOKEN"
fi

if [[ -z "${PROJECT_KEY}" ]]; then
    echo "Debes proporcionar PROJECT_KEY"
fi

if [[ -z "${PROJECT_PATH}" ]]; then
    echo "Debes proporcionar PROJECT_PATH"
fi

if [[ -z "${SONAR_HOST}" || -z "${SONAR_TOKEN}" || -z "${PROJECT_KEY}" ]]; then
    exit 1;
fi

dotnet sonarscanner begin /k:"$PROJECT_KEY" /d:sonar.host.url="$SONAR_HOST" /d:sonar.token="$SONAR_TOKEN"
dotnet build $PROJECT_PATH --no-incremental
dotnet sonarscanner end /d:sonar.token="$SONAR_TOKEN"
