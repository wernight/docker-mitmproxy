# mitmproxy

[![](https://badge.imagelayers.io/wernight/mitmproxy:latest.svg)](https://imagelayers.io/?images=wernight/mitmproxy:latest 'Get your own badge on imagelayers.io')

Containerized [mitmproxy](https://mitmproxy.org/), man-in-the-middle proxy:

 * **Small**: Using [Alpine Linux](https://hub.docker.com/_/alpine/).
 * **Simple**: Exposes default port, easy to extend.
 * **Secure**: Runs as non-root UID/GID `7799` (selected randomly to avoid mapping to an existing user).


## Usage

    $ docker run --rm -it [-v $PWD:/home/mitmproxy/.mitmproxy] -p 8080:8080 wernight/mitmproxy

The *volume mount* is optional: It's to [use the generated self-signed certificates](https://mitmproxy.org/doc/certinstall.html).

You can also start `mitmdump` by just adding that to the end of the command-line.

Once started, you can set your application/browser proxy:

  * Protocol: `HTTP`
  * Server: `localhost`
  * Port: `8080`

For example:

    $ http_proxy=http://localhost:8080/ curl http://google.com
    $ https_proxy=http://localhost:8080/ curl -k https://google.com

To use it for **Android**, first install the mitmproxy generated certificate, then set the [Android Wi-Fi proxy](http://stackoverflow.com/a/21069032/167897).


## Feedbacks

Improvement ideas and pull requests are welcome via
[Github Issue Tracker](https://github.com/wernight/docker-mitmproxy/issues).
