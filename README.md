# dump1090.image
A docker image to expose the output of dump1090 to other containers.

## usage
docker build -t dump1090 .

docker run --device [rtl-sdr dongle address] -p 8080:8080 dump1090

[rtl-sdr dongle address] will look like this - /dev/bus/usb/[bus]/[device]
where [bus] and [device] are reported by lsusb.

The point your browser at http://localhost:8080
