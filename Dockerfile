
FROM jupyter/minimal-notebook:latest

# -----------------------------------------------------------------------------
# --- Constants
# -----------------------------------------------------------------------------

# Set the desired version of almond
ENV ALMOND_VERSION="0.9.1"

# Set the desired version of SBT
ENV SBT_VERSION="1.2.7"

# -----------------------------------------------------------------------------
# --- Install dependencies
# -----------------------------------------------------------------------------

USER root

# Install software-properties and curl
RUN \
apt-get update \
&& apt-get install -y curl \
&& apt-get install -y openjdk-8-jdk \
&& rm -rf /var/lib/apt/lists/*

# Define JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/openjdk-8
ENV PATH=${PATH}:${JAVA_HOME}/bin

# -----------------------------------------------------------------------------
# --- Download and install Almond,  Scala kernel for Jupyter / IPython 3.
# --- For details, see https://github.com/almond-sh/almond
# -----------------------------------------------------------------------------

# Download SBT
RUN curl -sL --retry 5 "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" \
| gunzip \
| tar -x -C "/tmp/" \
&& mv "/tmp/sbt" "/opt/sbt-${SBT_VERSION}" \
&& chmod +x "/opt/sbt-${SBT_VERSION}/bin/sbt"

ENV PATH=${PATH}:/opt/sbt-${SBT_VERSION}/bin/

RUN curl -L -o /usr/local/bin/coursier https://git.io/coursier && chmod +x /usr/local/bin/coursier

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_USER

WORKDIR /tmp

ENV SCALA_VERSION="2.12.10"

RUN coursier bootstrap \
  -r jitpack \
  -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
  sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
  -o almond && \
  chmod +x almond && \
  ./almond --install

RUN rm /tmp/almond

WORKDIR /home/$NB_USER/work

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
