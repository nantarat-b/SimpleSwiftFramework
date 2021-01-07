xcodebuild clean build \
  -project SimpleSwiftFramework.xcodeproj \
  -scheme SimpleSwiftFramework \
  -configuration Release \
  -sdk iphoneos \
  -derivedDataPath derived_data \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  ONLY_ACTIVE_ARCH=NO

mkdir build/devices
cp -r derived_data/Build/Products/Release-iphoneos/SimpleSwiftFramework.framework build/devices

xcodebuild clean build \
  -project SimpleSwiftFramework.xcodeproj \
  -scheme SimpleSwiftFramework \
  -configuration Release \
  -sdk iphonesimulator \
  -derivedDataPath derived_data \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  EXCLUDED_ARCHS="arm64" \
  ONLY_ACTIVE_ARCH=NO

cp -r derived_data/Build/Products/Release-iphonesimulator/ build/simulator/

cp -r build/devices/SimpleSwiftFramework.framework build/universal/

lipo -create \
build/simulator/SimpleSwiftFramework.framework/SimpleSwiftFramework \
build/devices/SimpleSwiftFramework.framework/SimpleSwiftFramework \
-output build/universal/SimpleSwiftFramework.framework/SimpleSwiftFramework

cp -r \
build/simulator/SimpleSwiftFramework.framework/Modules/SimpleSwiftFramework.swiftmodule/* \
build/universal/SimpleSwiftFramework.framework/Modules/SimpleSwiftFramework.swiftmodule/
