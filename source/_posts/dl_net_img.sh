#!/bin/bash


grep "!\[.*\]\(.*\)" $1

sed  "/!\[.*\]\(.*\)/p" $1