# vapor-nginx-pg

This is an example Vapor app. It contains the app itself, as well as surrounding components (Postgres database, nginx frontend for providing secure connection), all runnable out of the box with `docker compose`. It is a good starting point for Vapor development of an API server which you could access from macOS and iOS clients.

The app supports several scenarios. You can run the whole thing built with docker-compose and not worry about the contents of anything. Or, you can run the Vapor app interactively from within Xcode (for development, debugging, testing) while the other components keep running in Docker. These scenarios are discussed below in greater detail.

The goal of this project is to illustrate deployment to your local macOS computer for development and testing. Although some ideas and code here may be suitable for production deployment, there are no guarantees about that, and it hasn’t been reviewed or battle-tested. Use at your own risk.

## Getting started

You can run the app almost out of the box. See the scenarios below.

The one thing that you do need to provide is the private key and certificate for TLS encryption (HTTPS). If you attempt to `docker compose up` right after cloning this repo, you will see errors about the certificate and key files not found. For security reasons, this project does not ship with a key and certificate: you must generate and provide your own.

### Preparing the key and certificate

See [this blog post](https://jaanus.com/ios-13-certificates/) for a discussion of TLS in modern macOS and iOS, and instructions for generating the key and certificate in a way that is acceptable to modern Apple platforms.

Create a temporary working folder. Follow the instructions in the post to generate your keys and certificates into that folder, and install the CA certificates into your devices. You will end up with a bunch of files, but only a few are relevant for this project.

After completing the generation process, do the following.

1. Add the development CA certificate to the server certificate, so that you end up with a single file containing the certificate chain. `cat development-ca.crt >> development.crt`.
1. Copy `development.crt` and `development.key` into `frontend/nginx` and `frontend-xcode/nginx`, next to `nginx.conf` that is already present in those folders.

That’s it. You can now run the system with `docker compose up` (add `-d` flag to daemonize if you want).
