#!/bin/bash
echo "Parando a aplicação existente..."
pkill -f 'java.*api-aws-1.0.0.jar' || true
