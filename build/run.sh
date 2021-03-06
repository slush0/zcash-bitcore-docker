#!/usr/bin/env bash
docker build -t zcash-build .

docker run -t \
    -v $(pwd)/res:/res \
    zcash-build \
    /bin/sh -c "cd zcash && ./zcutil/build.sh -j"$(nproc)" && cp src/zcashd /res"

cp res/zcashd ../
