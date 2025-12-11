#!/bin/bash
set -e

echo "⚙️ Patched Build.sh - Skipping version checks"

# Use system-installed tools
echo "✅ GCC:    $(g++ --version | head -n1)"
echo "✅ Clang:  $(clang++ --version | head -n1)"
echo "✅ CMake:  $(cmake --version | head -n1)"
echo "✅ Ninja:  $(ninja --version)"

# Create build directory
mkdir -p .build/clang

# Run cmake with clang++
cmake -S ../cmake  -B .build/clang -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# Build the project
cmake --build .build/clang
