FROM node:18-alpine

WORKDIR /app

# 必要なファイルをコピーして依存関係をインストール
COPY package*.json ./
RUN npm install

# アプリケーションコードをコピー
COPY . .

# ポートを公開
EXPOSE 3000

# サーバー起動コマンド
CMD ["npm", "run", "dev"]
