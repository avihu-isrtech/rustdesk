#!/usr/bin/env bash

cargo install flutter_rust_bridge_codegen --version 1.80.1 --features uuid
flutter pub get
~/.cargo/bin/flutter_rust_bridge_codegen --rust-input ../src/flutter_ffi.rs --dart-output ./lib/generated_bridge.dart --c-output ./macos/Runner/bridge_generated.h
# call `flutter clean` if cargo build fails
# export LLVM_HOME=/Library/Developer/CommandLineTools/usr/
cargo build --features flutter
echo "-----------------------------------------------------------------------------------------------------------------"
echo "------------------------------------------------ Running Flutter ------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
flutter run --disable-service-auth-codes --host-vmservice-port 64869 "${DEVICE_ARGS[@]}" "$@"
# Debug URL: http://127.0.0.1:64869/
