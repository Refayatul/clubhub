#!/bin/bash
# Wrapper script for DOM Cloud / Phusion Passenger
# Passenger executes this via bash, so $PORT env var is available
exec java -Xmx350m -jar "$(dirname "$0")/target/Clubhub4-0.0.1-SNAPSHOT.jar"
