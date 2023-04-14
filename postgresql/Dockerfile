FROM postgres:latest

# Create a directory for the persistent volume
RUN mkdir /var/lib/postgresql/data

# Set permissions for the directory
RUN chown postgres:postgres /var/lib/postgresql/data

# Mount the persistent volume onto the directory
VOLUME /var/lib/postgresql/data

# Expose the PostgreSQL port
EXPOSE 5432
