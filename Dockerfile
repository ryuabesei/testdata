FROM python:3.11-slim

# 必要なツール
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Python ライブラリ
RUN pip install --no-cache-dir \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    scikit-learn \
    cdflib

# 作業ディレクトリ
WORKDIR /workspace

# 簡単ログイン用トークンを設定
ENV JUPYTER_TOKEN=lab

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--ServerApp.token=${JUPYTER_TOKEN}"]
