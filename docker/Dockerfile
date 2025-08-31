FROM debian:trixie

RUN apt update
RUN apt install -y python3-pip python3-venv

RUN useradd -m user

USER user
ENV VENV=/home/user/browser-use
RUN python3 -mvenv $VENV
ENV PATH="$VENV/bin:$PATH"
RUN pip install browser-use[memory] pytest-playwright

USER root
RUN playwright install-deps chromium

USER user
RUN playwright install chromium --no-shell
RUN pip install langchain-google-genai

ADD agent.py $VENV/

WORKDIR $VENV
ENTRYPOINT ["./agent.py"]
