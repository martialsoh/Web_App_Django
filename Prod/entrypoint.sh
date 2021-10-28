#!/bin/bash

python3 manage.py collectstatic --noinput

echo "Running command '$*'"
exec /bin/bash -c "$*"