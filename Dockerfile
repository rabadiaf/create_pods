FROM python:3.10-slim

RUN apt-get update && apt-get install -y curl ansible && rm -rf /var/lib/apt/lists/*

ENV KUBECTL_VERSION=v1.30.0
RUN curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

WORKDIR /app

RUN mkdir -p /app/
COPY playbook.yml entrypoint.sh kubeconfig.embedded.yaml /app/
COPY pod.yaml /app/

ENV KUBECONFIG=/app/kubeconfig.embedded.yaml

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
