#!/bin/sh
swift package generate-xcodeproj
cat Project-to-append.xcconfig >> Gazooee.xcodeproj/Configs/Project.xcconfig
