#!/bin/sh

# Prisma migration
npx prisma migrate dev;
npx prisma generate;

# Run the command
exec "$@";
