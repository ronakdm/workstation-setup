#!/bin/bash

SOURCE=/mnt/ssd/chrisxie/DAVIS/2017/OpticalFlow/480p

cd ${SOURCE}
for fname in *
do
    echo ${fname}
    # scp ${SOURCE}/${fname} ${DEST}
done