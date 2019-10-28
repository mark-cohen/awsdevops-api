#!/bin/sh

# Exit the script as soon as something fails.
set -e

# pull down and export encrypted DB password
export MYSQL_PASSWORD=`aws ssm get-parameters --names ${SSM_DB_PWD} --with-decryption --output text --query 'Parameters[0].Value' --region ${AWS_DEFAULT_REGION}`

# once all previous steps are complete, execute the command at the end of the dockerfile:
exec "$@"