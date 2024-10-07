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

java -jar /app/target/shipping-1.0.jar
java -javaagent:/app/newrelic/newrelic.jar -jar /app/target/shipping-1.0.jar

