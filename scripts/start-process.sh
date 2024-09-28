#!/bin/bash
echo "Iniciando a nova versão da aplicação..."
nohup java -jar /opt/api-aws/api-aws-1.0.0.jar > /var/log/api-aws.log 2>&1 &
echo "Nova versão da aplicação iniciada..."
