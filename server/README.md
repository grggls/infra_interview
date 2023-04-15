# Requirements

- Node v12
- Yarn v1.22.4
- Postgres v12
- Redis v5

# Build

- Run `docker build -t infratestserver .` with a local registry (Docker Desktop works) running. 
- The `infratestserver` tag is required because we'll reference it in the `docker-compose.yml` files

# Installation

- Run `yarn`

# Execution

- Run `yarn start`
- If the server throws `ECONNREFUSED` errors and the postgres server seems healthy, it's most likely the case that an incorrect username/password are configured in the DB. Remember that Docker Compose won't throw away old volumes unless you explicitly tell it do so. The default postgres config has no username/password configured.

### Environment Variables

The following environment variables are supported:
| Name | Type | Description |Default |
|---|---|---|---|
| TYPEORM_HOST| string | Database host | localhost|
| TYPEORM_USERNAME| string | Database Username | pguser|
| TYPEORM_PASSWORD| string | Database Password | pgpass|
| TYPEORM_DATABASE| string | Database Name | pgdb|
| TYPEORM_PORT| number | Database host port | 5432|
| REDIS_HOST| string | Redis host | localhost|
| REDIS_PORT| string | Redis host port | 6379|
| REDIS_PASSWORD| string | Redis password | |
| PORT| string | HTTP server port | 3030|
