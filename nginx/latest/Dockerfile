FROM nginx

RUN echo "alias ll='ls -lah --color=auto'\nalias l='ll'\n" >> ~/.bashrc

RUN apt-get update -y \
	&& apt-get install vim iputils-ping --no-install-recommends -y \
	&& rm -rf /var/lib/apt/lists/*

