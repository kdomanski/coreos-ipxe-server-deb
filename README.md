# CoreOS iPXE server .deb packaging kit

This kit will download a release of `kelseyhightower/coreos-ipxe-server`, add some example config and a systemd unit file, and package those into a **.deb**.

Instead of properly using `debuild`, I'm assembling the package myself since I couldn't figure out how to use `dh-golang`.

### Building

Just type `make`. The binary will be downloaded from GitHub and then packaged with everything else.

`make clean` will delete the package as well as intermediary archives.

`make download` will force re-downloading the binary.

**Caveat**: Make sure to `chown root` the entire `data` directory after download (or clone and make as root). Otherwise the package will preserve current user's ownership.

### Package usage

`systemctl enable coreos-ipxe && systemctl start coreos-ipxe`

As simple as that.

Get acquainted with the server's "[Getting started](https://github.com/kelseyhightower/coreos-ipxe-server/blob/master/docs/getting_started.md)". The samples in `/opt/coreos-ipxe-server/` should be helpful.
