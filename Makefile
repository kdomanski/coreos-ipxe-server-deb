version = 0.3.0

package: data.tar.gz control.tar.gz data/usr/local/bin/coreos-ipxe-server
	ar rc coreos-ipxe-server-${version}.deb debian-binary control.tar.gz data.tar.gz

data.tar.gz:
	tar cvzf data.tar.gz -C data .

control.tar.gz:
	tar cvzf control.tar.gz control

clean:
	rm -f control.tar.gz data.tar.gz coreos-ipxe-server-${version}.deb

download:
	make -B data/usr/local/bin/coreos-ipxe-server

data/usr/local/bin/coreos-ipxe-server:
	mkdir -p data/usr/local/bin
	curl -L https://github.com/kelseyhightower/coreos-ipxe-server/releases/download/v${version}/coreos-ipxe-server-${version}-linux-amd64 -o data/usr/local/bin/coreos-ipxe-server
	chmod +x data/usr/local/bin/coreos-ipxe-server

.PHONY: clean package download
