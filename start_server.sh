#!/bin/bash

apt-get update && apt-get install python3-pip python3-dev python3-venv
python3 -m venv venv
source venv/bin/activate
pip install flask gunicorn
