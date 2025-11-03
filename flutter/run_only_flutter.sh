#!/usr/bin/env bash

flutter run --disable-service-auth-codes --host-vmservice-port 64869 "${DEVICE_ARGS[@]}" "$@"
# Debug URL: http://127.0.0.1:64869/
