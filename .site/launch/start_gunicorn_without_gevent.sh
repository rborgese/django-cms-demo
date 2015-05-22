#!/bin/bash
echo "  starting gunicorn"
exec gunicorn wsgi:application -b 0.0.0.0:${GUNICORN_PORT:-80} --config gunicorncfg.py -w ${GUNICORN_WORKERS:-4} --max-requests=${GUNICORN_MAX_REQUESTS} --graceful-timeout=${GUNICORN_TIMEOUT} --timeout=${GUNICORN_TIMEOUT} --access-logfile - --error-logfile - --log-level ${GUNICORN_LOG_LEVEL}
