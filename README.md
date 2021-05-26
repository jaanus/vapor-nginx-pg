# vapor-nginx-pg

This is an example Vapor app. It contains the app itself, as well as surrounding components
(Postgres database, nginx frontend for providing secure connection). It is a good starting point for
Vapor development of an API server which you could access from macOS and iOS clients.

The app supports two scenarios. You can run the whole thing built with docker-compose
and not worry about the contents of anything. Or, you can run the Vapor app interactively
from within Xcode (for development, debugging, testing) while the other components keep
running in Docker.
