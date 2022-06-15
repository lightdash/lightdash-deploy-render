#!/bin/bash
set -e

ENV SITE_URL $RENDER_EXTERNAL_URL

yarn workspace backend migrate-production

exec "$@"
