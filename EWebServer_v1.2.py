from http.server import SimpleHTTPRequestHandler
from http.server import CGIHTTPRequestHandler
from http.server import ThreadingHTTPServer
from functools import partial
import contextlib
import sys
import os

class DualStackServer(ThreadingHTTPServer):
    def server_bind(self):
        with contextlib.suppress(Exception):
            self.socket.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_V6ONLY, 0)
        return super().server_bind()


def run(server_class=DualStackServer,
        handler_class=SimpleHTTPRequestHandler,
        port=2023,
        bind='127.0.0.1',
        cgi=False,
        directory=os.getcwd()):


    if cgi:
        handler_class = partial(CGIHTTPRequestHandler, directory=directory)
    else:
        handler_class = partial(SimpleHTTPRequestHandler, directory=directory)

    with server_class((bind, port), handler_class) as httpd:
        httpd.serve_forever()



if __name__ == '__main__':
    run(port=2023, bind='127.0.0.1')
