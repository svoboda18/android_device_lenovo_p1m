
#!/bin/bash
cd ../../../..
cd system/core
git reset --hard && git clean -fd
cd ../..
cd frameworks/native
git reset --hard && git clean -fd
cd ../..
cd frameworks/base
git reset --hard && git clean -fd
cd ../..
cd hardware/ril
git reset --hard && git clean -fd
cd ../..
cd hardware/interfaces
git reset --hard && git clean -fd
cd ../..


