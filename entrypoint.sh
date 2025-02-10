#!/bin/bash
set -e

pnpm -F backend migrate-production

exec "$@"
