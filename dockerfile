FROM lightdash/lightdash:latest

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN npm i -g corepack@latest 
RUN corepack enable pnpm
RUN corepack prepare pnpm@9.15.5 --activate
RUN pnpm config set store-dir /pnpm/store

ARG RENDER_EXTERNAL_URL

ENV SITE_URL $RENDER_EXTERNAL_URL

COPY ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["pnpm", "-F", "backend", "start"]
