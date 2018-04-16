#!/bin/sh

nodes=( "hk1.node.catio.network"
        "jp3.node.catio.network"
        "jp1.node.catio.network"
        "hk2.node.catio.network"
        "ru1.node.catio.network"
        "cn2.node.catio.network" )

for node in ${nodes[@]}
do
    avg=$(ping -6 -c 4 $node 2> /dev/null | tail -1 | awk -F '/' '{print $5}')
    nod=$(echo $node | awk -F '.' '{print $1}')
    if [ $avg ] && [ -n $avg ]; then
        echo node-$nod avg ping time is $avg
    else
        echo node-$nod cannot be found
    fi
done
