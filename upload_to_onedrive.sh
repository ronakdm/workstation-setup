#!/bin/bash

SOURCE="gpu1:/mnt/ssd/chrisxie/DAVIS/2017/OpticalFlow/480p"
DEST="/Users/ronak/onedrive-uw/gpu1/chrisxie/DAVIS"

# move files
for fname in ${SOURCE}/*
do
    echo ${fname}
    # scp ${SOURCE}/${fname} ${DEST}
done