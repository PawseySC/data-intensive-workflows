#!/bin/bash

module load shifter

shifter pull ubuntu:18.04

shifter run ubuntu:18.04 cat /etc/os-release
