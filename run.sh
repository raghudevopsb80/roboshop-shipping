if [ -z "${CART_ENDPOINT}" ]; then
  echo Input CART_ENDPOINT is missing
  exit 1
fi

if [ -z "${DB_HOST}" ]; then
  echo Input DB_HOST is missing
  exit 1
fi

if [ -z "${NEW_RELIC_LICENSE_KEY}" ]; then
  echo Input NEW_RELIC_LICENSE_KEY is missing
  exit 1
fi

if [ -z "${NEW_RELIC_APP_NAME}" ]; then
  echo Input NEW_RELIC_APP_NAME is missing
  exit 1
fi

#sed -i -e "s/LICENSE_KEY/${NEW_RELIC_LICENSE_KEY}/" /app/newrelic/newrelic.yml
export PATH=$PATH:/opt/amazon-corretto-17.0.12.7.1-linux-x64/bin
/opt/amazon-corretto-17.0.12.7.1-linux-x64/bin/java -javaagent:/app/newrelic/newrelic.jar -Dnewrelic.config.license_key=${NEW_RELIC_LICENSE_KEY} -jar /app/shipping.jar

