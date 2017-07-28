#!/bin/bash

if [ x"$1" == x ]; then
    echo "input 1/2/3 !"
    exit 1
fi

/SERVICE01/kafka$1_create.sh
/SERVICE01/kafka$1_messagesize.sh>kafka$1_messagesize.xx
/SERVICE01/kafka$1_pcs.sh>kafka$1_pcs.xx
/SERVICE01/kafka$1_batchs.sh>kafka$1_batchs.xx
/SERVICE01/kafka$1_compressions.sh>kafka$1_compressions.xx
/SERVICE01/kafka$1_acks.sh>kafka$1_acks.xx
/SERVICE01/kafka$1_partitions.sh>kafka$1_partitions.xx

sed -i '/ WARN /d' *.xx
sed -i '/Exception/d' *.xx
sed -i '/	at /d' *.xx
sed -i '/start.time/d' *.xx
