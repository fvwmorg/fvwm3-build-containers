FROM debian:trixie-slim

RUN apt update && \
	apt --no-install-recommends --no-install-suggests -y install \
		asciidoctor \
		ca-certificates \
		clang \
		cmake \
		curl \
		gcc \
		gh \
		git \
		golang \
		lld \
		jq \
		libevent-dev \
		libfontconfig-dev \
		libfreetype6-dev \
		libfribidi-dev \
		libncurses5-dev \
		libpng-dev \
		libreadline-dev \
		librsvg2-dev \
		libsm-dev \
		libx11-dev \
		libxcursor-dev \
		libxext-dev \
		libxfixes-dev \
		libxft-dev \
		libxi-dev \
		libxkbcommon-dev \
		libxpm-dev \
		libxrandr-dev \
		libxrender-dev \
		libxt-dev \
		meson \
		pkg-config \
		sharutils \
		xtrans-dev
