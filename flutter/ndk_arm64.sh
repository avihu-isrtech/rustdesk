#!/usr/bin/env bash
cargo ndk --platform 21 --target aarch64-linux-android build --release --features flutter,hwcodec
rm flutter/android/app/src/main/jniLibs/arm64-v8a/librustdesk.so || true
mv target/aarch64-linux-android/release/liblibrustdesk.so flutter/android/app/src/main/jniLibs/arm64-v8a/librustdesk.so
