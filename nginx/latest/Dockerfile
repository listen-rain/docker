FROM nginx

RUN echo "alias ll='ls -lah'\n alias l='ll'\n" >> ~/.bashrc

RUN apt-get update -y \
	&& apt-get install vim --no-install-recommends -y \
	&& rm -rf /var/lib/apt/lists/*

