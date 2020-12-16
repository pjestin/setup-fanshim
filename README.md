## Description

This small script uses the [Pimoroni fanshim Python utility](https://github.com/pimoroni/fanshim-python) to create a single Python script. This script will be used by the systemctl service, such that you don't have to keep the whole repo on disk.

## What it does

* Install Python 3 if it is not present
* Clone the Pimoroni fanshim repo
* Run the install.sh script
* Install the systemctl service using examples/install-service.sh
* Copy the automatic.py file in the ~/.local/bin folder
* Change the service config file to point to the file copy
* Remove the repo and restart the service

## How to run it

In one command:

```
curl https://raw.githubusercontent.com/pjestin/setup-fanshim/main/setup-fanshim.sh | bash
```

or by cloning

```
git clone https://github.com/pjestin/setup-fanshim.git
./setup-fanshim.sh
```

