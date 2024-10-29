FROM scratch as shared

COPY / /

FROM quay.io/fedora/fedora-bootc:41

RUN --mount=type=bind,from=shared,src=/,dst=/shared \
    /shared/scripts/install.sh
