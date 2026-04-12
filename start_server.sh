#!/bin/bash

sudo apt-get update && sudo apt-get install python3-pip python3-dev
sudo python3 -m pip install -U flask gunicorn
